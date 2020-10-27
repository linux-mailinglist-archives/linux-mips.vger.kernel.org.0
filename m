Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C229B29AA27
	for <lists+linux-mips@lfdr.de>; Tue, 27 Oct 2020 11:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbgJ0K6S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Oct 2020 06:58:18 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36389 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728331AbgJ0K6S (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 27 Oct 2020 06:58:18 -0400
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1kXMg7-00046a-Qk; Tue, 27 Oct 2020 11:58:11 +0100
Subject: Re: [Linux-stm32] [PATCH v7 10/12] ARM: dts: stm32: Fix schema
 warnings for pwm-leds
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-leds@vger.kernel.org
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-11-post@lespocky.de>
 <b387bda8-3643-1d27-4996-2aa4dc94d69f@pengutronix.de>
 <20201027100536.cpfizc67gwrolp2z@falbala.internal.home.lespocky.de>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <f6ed201d-51b6-f278-7a95-3e3e49dc19ee@pengutronix.de>
Date:   Tue, 27 Oct 2020 11:58:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201027100536.cpfizc67gwrolp2z@falbala.internal.home.lespocky.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

On 10/27/20 11:05 AM, Alexander Dahl wrote:
> Hello Ahmad,
> 
> thanks for your feedback, comments below.
> 

>>> -	led-rgb {
>>> +	led-controller-2 {
>>
>> Is a single RGB LED really a controller?
> 
> I just followed the recommendations by Rob here.

Do you happen to know if the new multicolor LED support could be used here?

I find it unfortunate that the device tree loses information relevant to humans
to adhere to a fixed nomenclature. Apparently led-controller isn't even codified
in the YAML binding (It's just in the examples). If you respin, please add a
comment that this is a single RGB led. I'd prefer to keep the information
in the DTB as well though.



> 
>>>  		compatible = "pwm-leds";
>>>  
>>> -		led-red {
>>> +		led-2 {
>>
>> Shouldn't this have been led-1 as well or is the numbering "global" ?
> 
> Also good question. This numbering is for dts only, it usually does
> not correspond with LEDs on the board, so it could be numbered per
> led-controller as well?

I'd prefer that it starts by 1. That way it's aligned with PWM channel
ID.

Thanks for fixing the dtschema warnings by the way!

Cheers,
Ahmad

> 
> Greets
> Alex
> 
>>
>>>  			label = "mc1:red:rgb";
>>>  			pwms = <&leds_pwm 1 1000000 0>;
>>>  			max-brightness = <255>;
>>>  			active-low;
>>>  		};
>>>  
>>> -		led-green {
>>> +		led-3 {
>>>  			label = "mc1:green:rgb";
>>>  			pwms = <&leds_pwm 2 1000000 0>;
>>>  			max-brightness = <255>;
>>>  			active-low;
>>>  		};
>>>  
>>> -		led-blue {
>>> +		led-4 {
>>>  			label = "mc1:blue:rgb";
>>>  			pwms = <&leds_pwm 3 1000000 0>;
>>>  			max-brightness = <255>;
>>>
>>
>> -- 
>> Pengutronix e.K.                           |                             |
>> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
>> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
>> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
