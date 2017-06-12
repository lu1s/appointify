class ApiCalendarController < ApplicationController
	def create_calendar
		if !check_authenticated
			return
		end
		if params[:name].nil? or params[:name] == ''
			error_response 400, "Invalid parameters"
			return
		end
		calendar = Calendar.create(name: params[:name])
		if !params[:description].nil? and params[:description] != ''
			calendar.description = params[:description]
		end
		calendar.save
		success_response {calendar: calendar}, "OK"
	end

	def get_calendars
		if !check_authenticated
			return
		end
		if params[:company_id].nil? or params[:company_id] == ''
			calendars = Calendar.where(superuser_id: @superuser.id)
		else
			calendars = Calendar.where(superuser_id: @superuser.id, company_id: params[:company_id])
		end
		success_response {calendars: calendars}, "OK"
	end

	def get_calendar
		if !check_authenticated
			return
		end
		if params[:id].nil? or params[:id] == ''
			error_response 400, "Invalid parameters"
			return
		end
		calendar = Calendar.where(superuser_id: @superuser.id, id: params[:id]).first
		if calendar.nil?
			error_response 404, "Calendar not found"
			return
		end
		calendar_ranges = CalendarRange.where(calendar_id: params[:id])
		success_response {calendar: calendar, ranges: calendar_ranges}, "OK"
	end

	def create_calendar_range
		if !check_authenticated
			return
		end
		if params[:calendar_id].nil? or params[:calendar_id] == '' or params[:weekday_id].nil? or params[:weekday_id] == '' or params[:start_time].nil? or params[:start_time] == '' or params[:end_time].nil? or params[:end_time] == ''
			error_response 400, "Invalid parameters"
			return
		end
		calendar = Calendar.where(superuser_id: @superuser.id, id: params[:calendar_id]).first
		if calendar.nil?
			error_response 404, "Calendar not found"
			return
		end
		calendar_range = CalendarRange.create(calendar_id: params[:calendar_id], week_day_id: params[:weekday_id], start_time: params[:start_time], end_time: params[:end_time])
		success_response {calendar_range: calendar_range}, "OK"
	end


end