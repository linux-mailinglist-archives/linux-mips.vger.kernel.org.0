Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46FAA2A2876
	for <lists+linux-mips@lfdr.de>; Mon,  2 Nov 2020 11:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728317AbgKBKrO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Nov 2020 05:47:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728005AbgKBKrN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Nov 2020 05:47:13 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CF64C0617A6
        for <linux-mips@vger.kernel.org>; Mon,  2 Nov 2020 02:47:13 -0800 (PST)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1kZXMj-0002mr-0j; Mon, 02 Nov 2020 11:47:09 +0100
Subject: Re: [Linux-stm32] [PATCH v7 10/12] ARM: dts: stm32: Fix schema
 warnings for pwm-leds
To:     Alexander Dahl <ada@thorsis.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-leds@vger.kernel.org
References: <20201005203451.9985-1-post@lespocky.de>
 <20201027100536.cpfizc67gwrolp2z@falbala.internal.home.lespocky.de>
 <f6ed201d-51b6-f278-7a95-3e3e49dc19ee@pengutronix.de>
 <5231529.NqohY00Rok@ada>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <cba67329-d79d-b474-c4b4-77b19aebe52f@pengutronix.de>
Date:   Mon, 2 Nov 2020 11:47:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <5231529.NqohY00Rok@ada>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Alexander,

On 10/28/20 8:34 AM, Alexander Dahl wrote:
> Hello Ahmad,
> 
> Am Dienstag, 27. Oktober 2020, 11:58:10 CET schrieb Ahmad Fatoum:
>> Hello,
>>
>> On 10/27/20 11:05 AM, Alexander Dahl wrote:
>>> Hello Ahmad,
>>>
>>> thanks for your feedback, comments below.
>>>
>>>>> -	led-rgb {
>>>>> +	led-controller-2 {
>>>>
>>>> Is a single RGB LED really a controller?
>>>
>>> I just followed the recommendations by Rob here.
>>
>> Do you happen to know if the new multicolor LED support could be used here?
> 
> AFAIK not yet. The multicolor class should be ready and it is used by some 
> drivers for I²C connected LED controllers, but if I understood Pavel 
> correctly, additional work has to be done for a gpio and/or pwm multicolor 
> driver. See this thread from August for example:
> 
> https://lore.kernel.org/linux-leds/2530787.iFCFyWWcSu@g550jk/

I see. Thanks for the info.

>> I find it unfortunate that the device tree loses information relevant to
>> humans to adhere to a fixed nomenclature. Apparently led-controller isn't
>> even codified in the YAML binding (It's just in the examples). If you
>> respin, please add a comment that this is a single RGB led. I'd prefer to
>> keep the information in the DTB as well though.
> 
> The "new" attributes 'function' and 'color' attributes should cover this 
> information. IIRC those were introduced sometime before v5.4 and documentation 
> is in the leds/common.yaml binding. I don't see it in the scope of this patch 
> series, but if we would merge this warning fix first, the information is lost, 
> so maybe those attributes should be added before?

Does it? The label already says it's a green LED, but the information that
it's a single physical LED 'bulb' is lost.

> 
> My heuristics on that would be looking at the label and if there's a distinct 
> color in it, add the color property. I could do that for all pwm LEDs known to 
> the tree currently. That would be a bigger task for GPIO leds though. ;-)

I would be ok with just the led-containing node hinting that it's a single RGB led.

Cheers,
Ahmad

> 
>>
>>>>>  		compatible = "pwm-leds";
>>>>>
>>>>> -		led-red {
>>>>> +		led-2 {
>>>>
>>>> Shouldn't this have been led-1 as well or is the numbering "global" ?
>>>
>>> Also good question. This numbering is for dts only, it usually does
>>> not correspond with LEDs on the board, so it could be numbered per
>>> led-controller as well?
>>
>> I'd prefer that it starts by 1. That way it's aligned with PWM channel
>> ID.
> 
> Ack.
> 
>>
>> Thanks for fixing the dtschema warnings by the way!
> 
> Well, I "introduced" them by converting the leds-pwm binding to yaml (not 
> merged yet), so I could as well fix the warnings then? ;-)
> 
> Greets
> Alex
> 
>>
>> Cheers,
>> Ahmad
>>
>>> Greets
>>> Alex
>>>
>>>>>  			label = "mc1:red:rgb";
>>>>>  			pwms = <&leds_pwm 1 1000000 0>;
>>>>>  			max-brightness = <255>;
>>>>>  			active-low;
>>>>>  		
>>>>>  		};
>>>>>
>>>>> -		led-green {
>>>>> +		led-3 {
>>>>>
>>>>>  			label = "mc1:green:rgb";
>>>>>  			pwms = <&leds_pwm 2 1000000 0>;
>>>>>  			max-brightness = <255>;
>>>>>  			active-low;
>>>>>  		
>>>>>  		};
>>>>>
>>>>> -		led-blue {
>>>>> +		led-4 {
>>>>>
>>>>>  			label = "mc1:blue:rgb";
>>>>>  			pwms = <&leds_pwm 3 1000000 0>;
>>>>>  			max-brightness = <255>;
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
