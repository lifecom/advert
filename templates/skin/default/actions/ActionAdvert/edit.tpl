{assign var="noSidebar" value=true} 
{include file='header.tpl'}
{include file='menu.settings.tpl'}

{assign var="bgcolor" value="#dcdcdc"} 

<span class="advert_button_wrapper" >
	<a href="{router page='advert'}settings/sort/{$oAdvert->getAdvertUserOwnerLogin()}/all/#{$oAdvert->getAdvertId()}"><span class="advert_button">Назад к списку</span></a>
</span>
<br/><br/>
Пользователь <b>{$oAdvert->getAdvertUserOwnerLogin()}</b>, # <b>{$oAdvert->getAdvertId()}</b>
<br/><br/>
<form action="" method="post" enctype="multipart/form-data" id="advert_edit" name="advert_edit">
<table border="1" width="100%" CELLPADDING="10" CELLSPACING="10">
	<tr>
		<td bgcolor="{$bgcolor}" width="15%">{$aLang.plugin.advert.table_hint}</td>
		<td><input type="text" name="advert_hint" id="advert_hint" class="input-text input-width-full" value="{$oAdvert->getAdvertHint()}"></td>
	</tr>
	<tr>
		<td bgcolor="{$bgcolor}">{$aLang.plugin.advert.table_text}</td>
		<td><textarea name="advert_data_text" id="advert_data_text" rows="5" class="input-text input-width-full">{$oAdvert->getAdvertDataText()}</textarea></td>
	</tr>	
	<tr>
		<td bgcolor="{$bgcolor}">{$aLang.plugin.advert.table_url}</td>
		<td><input type="text" name="advert_data_url" id="advert_data_url" class="input-text input-width-full" value="{$oAdvert->getAdvertDataUrl()}"></td>
	</tr>	
	
	<tr>
		<td rowspan="2" bgcolor="{$bgcolor}">{$aLang.plugin.advert.table_img}</td>
	
		<td>
			<input name="advert_userfile" type="file" onchange="advert_uploadfile(this);">	
			<span id="advert_userfile_size_hint"></span>
			
			<div id="advert_userfile_preview_hint" style="display: none; margin: 10px; text-align:center">
							Ширина <input type="text" readonly name="img_width" id="advert_userfile_preview_hint_width" class="input-text" style="width:50px;">
							Высота <input type="text" readonly name="img_height" id="advert_userfile_preview_hint_height" class="input-text" style="width:50px;">
							
							X1<input type="text" readonly name="img_x1" id="advert_userfile_preview_hint_x1" class="input-text" style="width:50px;">
							Y1<input type="text" readonly name="img_y1" id="advert_userfile_preview_hint_y1" class="input-text" style="width:50px;">
							X2<input type="text" readonly name="img_x2" id="advert_userfile_preview_hint_x2" class="input-text" style="width:50px;">
							Y2<input type="text" readonly name="img_y2" id="advert_userfile_preview_hint_y2" class="input-text" style="width:50px;">
							<input type="hidden" name="img_width_org" id="advert_userfile_preview_hint_width_org">
							<input type="hidden" name="img_height_org" id="advert_userfile_preview_hint_height_org">
							<input type="hidden" name="img_width_new" id="advert_userfile_preview_hint_width_new">
							<input type="hidden" name="img_height_new" id="advert_userfile_preview_hint_height_new">
			</div>	
			
			<table border="0" width="100%" CELLPADDING="0" CELLSPACING="0" id="advert_userfile_preview_table" >
				<tr>
					<td align="center">
						<div id="advert_userfile_preview">
							<img src="" id="advert_userfile_img">
						</div>	
					</td>	
				</tr>
			</table>
		</td>
		
	</tr>	
	<tr>
		<td>
			Или укажите URL &darr;
			<input type="text" name="advert_data_img" id="advert_data_img" class="input-text input-width-full" value="{$oAdvert->getAdvertDataImg()}">
		</td>
	</tr>	
	{**}
	<tr>
		<td bgcolor="{$bgcolor}">Параметры блока</td>
		<td>
			<table border="1" width="100%" CELLPADDING="10" CELLSPACING="0">
				<tr>
					<td bgcolor="{$bgcolor}" width="15%">Место размещения</td>
					<td>
						<select name="advert_block_place">
							{foreach $aBlockPlaces key=place item=placeName}
								{if $place == $oAdvert->getAdvertBlockPlace()}
									<option selected value="{$place}">{$placeName}</option>
								{else}
									<option value="{$place}">{$placeName}</option>
								{/if}
							{/foreach}
						</select>
					</td>					
				</tr>
				<tr>
					<td bgcolor="{$bgcolor}">Тип блока</td>
					<td>
						<select name="advert_block_type" id="advert_block_type" onChange="advert_changeStyle(this.options[this.selectedIndex].value, '{$oAdvert->getAdvertUserOwnerLogin()}');">
							{foreach $aBlockTypes key=type item=typeName}
								{if $type == $oAdvert->getAdvertBlockType()}
									<option selected value="{$type}">{$typeName}</option>
								{else}
									<option value="{$type}">{$typeName}</option>
								{/if}
							{/foreach}
						</select>
					</td>					
				</tr>				
				<tr>	
					<td bgcolor="{$bgcolor}">Css стиль для блока</td>
					<td>
						<div id="advert_block_css_wrapper">
							<div id="advert_block_css">						
								<select name="advert_block_css">
									{foreach $aCss key=css item=cssName}
										{if $css == $oAdvert->getAdvertBlockCss()}
											<option selected value="{$css}">{$cssName}</option>
										{else}
											<option value="{$css}">{$cssName}</option>
										{/if}
									{/foreach}
								</select>
							</div>
						</div>			
					</td>
				</tr>				
				{if $isAdministrator}
				<tr>	
					<td bgcolor="{$bgcolor}">Перекрывать</td>
					<td>
						<select name="advert_block_rewrite">
							{if $oAdvert->getAdvertBlockRewrite()}
								<option selected value="1">Да</option>
								<option value="0">Нет</option>
							{else}
								<option selected value="0">Нет</option>
								<option value="1">Да</option>
							{/if}

						</select>
					</td>
				</tr>
				{/if}
				
				<tr>	
					<td bgcolor="{$bgcolor}">Приоритет</td>
					<td>
						<select name="advert_block_priority">
							{for $priority=1 to 9}
								{if $priority == $oAdvert->getAdvertBlockPriority()}
									<option selected value="{$priority}">{$priority}</option>
								{else}
									<option value="{$priority}">{$priority}</option>
								{/if}	
							{/for}											
						</select>
					</td>
				</tr>
			</table>	
		</td>
	</tr>
	{**}

	<tr>
		<td bgcolor="{$bgcolor}">Где размещать</td>
		<td>
			<table border="1" width="100%" CELLPADDING="10" CELLSPACING="0">

			<tr align="center">
				{foreach from=$aActions item=action}
					<td width="10%" bgcolor="{$bgcolor}">{$action}</td>
				{/foreach}	
			</tr>
			<tr align="center">
				{foreach from=$aActions item=action}
					{if $aRulesAction[$action] == 1}
						<td><input type="checkbox" name="advert_action_{$action}" value="1" checked></td>
					{else}
						<td><input type="checkbox" name="advert_action_{$action}" value="1"></td>
					{/if}
				{/foreach}	
			</tr>			
			
			{if $isAdministrator}
			<tr>
				<td colspan="{$aActions|@count}">
					Блоги &darr; <input type="text" class="input-text input-width-full autocomplete-advert-blogs" id="advert_blogs" name="advert_blogs" value="{$sRulesBlogs}" />
				</td>
			</tr>	
				
			<tr>
				<td colspan="{$aActions|@count}">
					Пользователи &darr; <input type="text" class="input-text input-width-full autocomplete-advert-users" id="advert_users" name="advert_users" value="{$sRulesUsers}" />
				</td>
			</tr>	
			{/if}
			
			<tr>
				<td colspan="{$aActions|@count}">
					Топики &darr; <input type="text" class="input-text input-width-full autocomplete-advert-topics" id="advert_topics" name="advert_topics" value="{$sRulesTopics}" />
				</td>
			</tr>										
			</table>
			
			
		</td>
	</tr>	
	<tr>
		<td bgcolor="{$bgcolor}">
			Условия остановки
		</td>
		<td>
			<table border="1" width="100%" CELLPADDING="10" CELLSPACING="0">
				<tr>
					<td bgcolor="{$bgcolor}" width="15%">Просмотры</td>
					<td><input type="text" name="advert_view" class="input-text" value="{$oAdvert->getAdvertView()}"> или</td>
				</tr>
			
				<tr>
					<td bgcolor="{$bgcolor}">Переходы</td>
					<td><input type="text" name="advert_click" class="input-text" value="{$oAdvert->getAdvertClick()}"> или</td>
				</tr>
			
				<tr>
					<td bgcolor="{$bgcolor}">{$aLang.plugin.advert.table_data_tostop}</td>
					<td>
					Год
					<select name="advert_date_tostop_year" id="advert_date_tostop_year">
						{for $year=2012 to 2099}
							{if $year == $sDateYearToStop}
								<option selected value="{$year}">{$year}</option>
							{else}
								<option value="{$year}">{$year}</option>
							{/if}	
						{/for}
					</select> 
					Месяц
					<select name="advert_date_tostop_month" id="advert_date_tostop_month">
						{for $month=1 to 12}
							{if $month == $sDateMonthToStop}
								{assign var="selected_value" value="selected"}
							{else}
								{assign var="selected_value" value=""}
							{/if}
							
							{if $month>9}
								<option {$selected_value} value="{$month}">{$month}</option>
							{else}
								<option {$selected_value} value="0{$month}">0{$month}</option>
							{/if}	
						{/for}					
					</select>
					День
					<select name="advert_date_tostop_day" id="advert_date_tostop_day">
						{for $day=1 to 31}
							{if $day == $sDateDayToStop}
								{assign var="selected_value" value="selected"}
							{else}
								{assign var="selected_value" value=""}
							{/if}			
							{if $day>9}
								<option {$selected_value} value="{$day}">{$day}</option>
							{else}
								<option {$selected_value} value="0{$day}">0{$day}</option>
							{/if}	
						{/for}	
					</select>
					Часы
					<select name="advert_date_tostop_hour" id="advert_date_tostop_hour">
						{for $hour=1 to 23}
							{if $hour == $sDateHourToStop}
								{assign var="selected_value" value="selected"}
							{else}
								{assign var="selected_value" value=""}
							{/if}			
							{if $hour>9}
								<option {$selected_value} value="{$hour}">{$hour}</option>
							{else}
								<option {$selected_value} value="0{$hour}">0{$hour}</option>
							{/if}	
						{/for}	
					</select>
					Минуты
					<select name="advert_date_tostop_min" id="advert_date_tostop_min">
						{for $min=1 to 59}
							{if $min == $sDateMinToStop}
								{assign var="selected_value" value="selected"}
							{else}
								{assign var="selected_value" value=""}
							{/if}				
							{if $min>9}
								<option {$selected_value} value="{$min}">{$min}</option>
							{else}
								<option {$selected_value} value="0{$min}">0{$min}</option>
							{/if}	
						{/for}	
					</select>
					Секунды	
					<select name="advert_date_tostop_sec" id="advert_date_tostop_sec">
						{for $sec=1 to 59}
							{if $sec == $sDateSecToStop}
								{assign var="selected_value" value="selected"}
							{else}
								{assign var="selected_value" value=""}
							{/if}			
							{if $sec>9}
								<option {$selected_value} value="{$sec}">{$sec}</option>
							{else}
								<option {$selected_value} value="0{$sec}">0{$sec}</option>
							{/if}	
						{/for}	
					</select>		
					</td>
				</tr>
			</table>
		</td>
	</tr>	
	<tr>
		<td bgcolor="{$bgcolor}">
			Отложить старт
		</td>
		<td>
		{**}
			<table border="1" width="100%" CELLPADDING="10" CELLSPACING="0">
				<tr>
					<td bgcolor="{$bgcolor}" width="15%">
						Использовать ?
					</td>
					<td>
						{if $oAdvert->getAdvertDateToStartFlag()}
							<input type="checkbox" name="advert_date_tostart_flag" value="1" id="advert_date_tostart_flag" checked>
						{else}
							<input type="checkbox" name="advert_date_tostart_flag" value="1" id="advert_date_tostart_flag">
						{/if}
					</td>
				</tr>
				<tr>
					<td bgcolor="{$bgcolor}">
						Дата
					</td>
					<td>
						Год
						<select name="advert_date_tostart_year" id="advert_date_tostart_year">
							{for $year=2012 to 2099}
								{if $year == $sDateYearToStart}
									<option selected value="{$year}">{$year}</option>
								{else}
									<option value="{$year}">{$year}</option>
								{/if}	
							{/for}
						</select> 
						Месяц
						<select name="advert_date_tostart_month" id="advert_date_tostart_month">
							{for $month=1 to 12}
								{if $month == $sDateMonthToStart}
									{assign var="selected_value" value="selected"}
								{else}
									{assign var="selected_value" value=""}
								{/if}
								
								{if $month>9}
									<option {$selected_value} value="{$month}">{$month}</option>
								{else}
									<option {$selected_value} value="0{$month}">0{$month}</option>
								{/if}	
							{/for}					
						</select>
						День
						<select name="advert_date_tostart_day" id="advert_date_tostart_day">
							{for $day=1 to 31}
								{if $day == $sDateDayToStart}
									{assign var="selected_value" value="selected"}
								{else}
									{assign var="selected_value" value=""}
								{/if}			
								{if $day>9}
									<option {$selected_value} value="{$day}">{$day}</option>
								{else}
									<option {$selected_value} value="0{$day}">0{$day}</option>
								{/if}	
							{/for}	
						</select>
						Часы
						<select name="advert_date_tostart_hour" id="advert_date_tostart_hour">
							{for $hour=1 to 23}
								{if $hour == $sDateHourToStart}
									{assign var="selected_value" value="selected"}
								{else}
									{assign var="selected_value" value=""}
								{/if}			
								{if $hour>9}
									<option {$selected_value} value="{$hour}">{$hour}</option>
								{else}
									<option {$selected_value} value="0{$hour}">0{$hour}</option>
								{/if}	
							{/for}	
						</select>
						Минуты
						<select name="advert_date_tostart_min" id="advert_date_tostart_min">
							{for $min=1 to 59}
								{if $min == $sDateMinToStart}
									{assign var="selected_value" value="selected"}
								{else}
									{assign var="selected_value" value=""}
								{/if}				
								{if $min>9}
									<option {$selected_value} value="{$min}">{$min}</option>
								{else}
									<option {$selected_value} value="0{$min}">0{$min}</option>
								{/if}	
							{/for}	
						</select>
						Секунды	
						<select name="advert_date_tostart_sec" id="advert_date_tostart_sec">
							{for $sec=1 to 59}
								{if $sec == $sDateSecToStart}
									{assign var="selected_value" value="selected"}
								{else}
									{assign var="selected_value" value=""}
								{/if}			
								{if $sec>9}
									<option {$selected_value} value="{$sec}">{$sec}</option>
								{else}
									<option {$selected_value} value="0{$sec}">0{$sec}</option>
								{/if}	
							{/for}	
						</select>	
					</td>
				</tr>	
			</table>		
		{**}
		</td>
	</tr>	
</table>
<br/>
<input type="hidden" name="security_ls_key" value="{$LIVESTREET_SECURITY_KEY}" />
<input type="hidden" name="advert_id" value="{$oAdvert->getAdvertId()}">
<input type="hidden" name="user_owner_login" value="{$oAdvert->getAdvertUserOwnerLogin()}">
<input type="hidden" name="advert_talk_id" value="{$oAdvert->getAdvertTalkId()}">

<span class="advert_button_wrapper" >
	<a href="{router page='advert'}settings/sort/{$oAdvert->getAdvertUserOwnerLogin()}/all/#{$oAdvert->getAdvertId()}"><span class="advert_button">Назад к списку</span></a>
</span>

<span style="float:right;">
	{hook run='advert_version_info'}
</span>

<button type="submit" class="button button-primary" name="submit_page_edit" onClick="return advert_checkAddData('advert_edit');">Сохранить данные</button>
</form>

<div id="advert_help_page_wrapper" class="advert_help_page_wrapper">
	<div style="position: absolute; top: -15px; right: -15px; padding: 10px; background: #333; color: white; border-radius: 100px; cursor: pointer;" onclick="jQuery('#advert_help_page_wrapper').fadeToggle(); return false;">x</div>
	<div id="advert_help_page_content">
		<table border="1" width="100%" CELLPADDING="10" CELLSPACING="2">
			<tr align="center">
				<td width="30%" bgcolor="#dcdcdc"><b>Настройка</b></td>
				<td bgcolor="#dcdcdc"><b>Описание ошибки</b></td>
			</tr>

				<tr id="advert_date_tostop_hint">
					<td id="advert_date_tostop_field" bgcolor="#dcdcdc">Условия остановки &rarr; Остановить</td>
					<td id="advert_date_tostop_error">Дата остановки указана неправильно. Дата остановки не может быть меньше текущей даты.</td>
				</tr>


				<tr id="advert_date_tostart_hint">
					<td id="advert_date_tostart_field" bgcolor="#dcdcdc">Отложить старт &rarr; Дата</td>
					<td id="advert_date_tostart_error">Дата отложенного старта не может быть меньше тeкущей даты.</td>
				</tr>
			
		</table>	
	</div>
</div>


{include file='footer.tpl'}

{literal}
<script type="text/javascript">
//<![CDATA[
$(document).ready(function() {
	var blocktype = $("#advert_block_type option:selected").val();
	if(blocktype == 'text')
	{
		$("#advert_hint").css({'background': '#CCFF99'});
		$("#advert_data_text").css({'background': '#CCFF99'});
		$("#advert_data_url").css({'background': '#CCFF99'});
		$("#advert_data_img").css({'background': '#CCFF99'});
	}
	else if(blocktype == 'banner')
	{
		$("#advert_data_url").css({'background': '#CCFF99'});
		$("#advert_data_img").css({'background': '#CCFF99'});	
	}
	else if(blocktype = 'code')
	{
		$("#advert_data_text").css({'background': '#CCFF99'});
	}
});	
//]]>
</script>
{/literal}