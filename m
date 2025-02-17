Return-Path: <linux-mips+bounces-7805-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC1CA38B14
	for <lists+linux-mips@lfdr.de>; Mon, 17 Feb 2025 19:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71B88188D5FA
	for <lists+linux-mips@lfdr.de>; Mon, 17 Feb 2025 18:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350AC23536C;
	Mon, 17 Feb 2025 18:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="h9Q9Ldcv"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E335517DE2D
	for <linux-mips@vger.kernel.org>; Mon, 17 Feb 2025 18:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739815862; cv=none; b=WGDRKxjfCI9qIhRhqR8m3MUBIqjVMoiJNZsb3XLjsPLsSI11Xt1yz5KK4LQmGDs403I4auJw2ssAMr2vliKq0ohSgwTV50UdX0XDJmUVgran3g6D1Xc24wPTi4lmbjBS7sdB8/SLrIoEOYjeK0eoUvFzOPPf1iBC+0EO19UYWVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739815862; c=relaxed/simple;
	bh=+LVuhMm4/4IRWnEOXMkAQzqq62/PlHDeymErvUeBidk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AQWohsOhE9BSjZtVqnQTJlaDHcZaj1gCwTTd7ExwhP7nyzVOe3Dwh/Mw4nSVHii5Y2AtUgWC1WCPGmmAa25La+uH9tT8QBh8oMIW4ULYFYVQmQu1G/VOifKdrHaxriG+90IssMqmpn66ekOFxSNdoBWw+yJhXwRAWzCr+wZLZG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=h9Q9Ldcv; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38f286b5281so2158096f8f.1
        for <linux-mips@vger.kernel.org>; Mon, 17 Feb 2025 10:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739815858; x=1740420658; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WYdQMpmWfwfRPZrNOq/JI6U8Fyr73ByGTD+9Af1nU7I=;
        b=h9Q9LdcvKJavN/GMUzW7WoMBUj9hTQJkk6CNQ25jgzMyqIbEpobg08+aZqKeuJGovz
         ci0Rf3Epyn59Xo0hYLEbCMF5drcL/2u+Misdyw3PIIRNMkqSacU/YWvag6kJqfo25RGA
         sOZnQ7QjLyKGg67A3GqD/tYAjCRiGA+2Mb7QpUCN1sMBNT75BlR1i5Vo0GowlhkoCOpJ
         LpvymOZwvGsxWaMsn9HwRatf63LNma+EjSfTKmcJ2P6o6zp0VjftAkLR3H9YbgXxOUnz
         DgdDq2+WdFSs5lUDhIrGmolWKJjxTm1DkGn0IMeBaWcVXaL0LsqqAXNjvqgQRu4+HZEX
         FUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739815858; x=1740420658;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYdQMpmWfwfRPZrNOq/JI6U8Fyr73ByGTD+9Af1nU7I=;
        b=o81uQMlnxL0w4SmIyA4cWsZYHI1Qnsy43AWMUxDwn0ZN4oR3eHXXs/U6bUhKcMZD35
         ssjjHkvSdCAlp/TusMdnTM8xaN7pRRlIawLRK8FFu5JSEGQ8Tgdf4745GEPJB6IogJ5s
         On6LVh4ecAt0ovc+Fe/rQQi/P8KHrUwUSClpfu7l1p+fu0RIXNVMHM7gFk0L4jx0h2C8
         s+IXgROKURAYLhE4HGd07Ve0jzvxEhtnnGr6O6XFjk7sCZBLFRZHZhrTbD8iPOHb4KMK
         G4L4d03HwoKg4arykhS1gvpGFwiBT3iLyVTWib9WeNOPb2fizjoGo/YX5YV3qYFQHj+n
         f5eQ==
X-Forwarded-Encrypted: i=1; AJvYcCVl+uJb30kUN+KAV2wHc0fVROc5jp3UULTBI4Y3V1I/vWh77b/ZhEMxXEJN/DtVu92OBoc7CJFH14b4@vger.kernel.org
X-Gm-Message-State: AOJu0YzE5Bx3Zv6wirIrL3RvE3Ydj18hlNIhwDyKf2ZTgAiR3DvVS6B8
	oQk0DPvsRrXRaB5xpbO+cqxrb6M6Puw7ykwQrDdlGUQ8HIEl4u8SSs9O6ESxrCU=
X-Gm-Gg: ASbGncvk4pkhvBMaxnQfpxmMXfvUvS/w0tXe+zrQGU7g+p2d1koLFc4k+p4a9ojdP8w
	fXJr8FdWAc7ARtawOoXYXQqX1GlMqrhmEfhU2yLsHV0iMD0yRFfxtDqE++ClXGRTkLWLRm3NdN1
	mb2BWSdqOVChNIzcw2jOBqCe3Y+pb/cCyWuGJFlDoZzGY1H1Chxerxp5GsAtfaFEQKXdzWOX9KP
	kl8DdkPHs5i6H/PVJxVsGwc9yb10uYLaYM8vCF1HEXirMB8g15J+KAxhr4Tl1Ws/7MfgcE3YFn4
	F64884lGlIDIbw==
X-Google-Smtp-Source: AGHT+IFTAKZ9BquOVY29sEYMChLDnuqHcqVlSqR4NiZlMjD4bUMe9qRI5EU9r/6iyIf02WCX+Y2KzA==
X-Received: by 2002:a5d:4cca:0:b0:38a:2b34:e13e with SMTP id ffacd0b85a97d-38f33f28c01mr7768806f8f.18.1739815856721;
        Mon, 17 Feb 2025 10:10:56 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:a529:8667:e9bd:7f7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4395afaf052sm155075695e9.13.2025.02.17.10.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 10:10:55 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,  Ira Weiny
 <ira.weiny@intel.com>,  "Rafael J. Wysocki" <rafael@kernel.org>,  Stephen
 Boyd <sboyd@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,  Danilo Krummrich
 <dakr@kernel.org>,  Conor Dooley <conor.dooley@microchip.com>,  Daire
 McNamara <daire.mcnamara@microchip.com>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Douglas Anderson <dianders@chromium.org>,
  Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 1/7] driver core: auxiliary bus: add device creation
 helpers
In-Reply-To: <2025021501-tamer-sank-142a@gregkh> (Greg Kroah-Hartman's message
	of "Sat, 15 Feb 2025 07:53:12 +0100")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
	<20250211-aux-device-create-helper-v3-1-7edb50524909@baylibre.com>
	<2025021437-washout-stonewall-d13e@gregkh>
	<1jwmdsxugx.fsf@starbuckisacylon.baylibre.com>
	<2025021501-tamer-sank-142a@gregkh>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Mon, 17 Feb 2025 19:10:54 +0100
Message-ID: <1jikp8xx01.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat 15 Feb 2025 at 07:53, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

[...]

>> 
>> >
>> >> +							int id)
>> >> +{
>> >> +	struct auxiliary_device *auxdev;
>> >> +	int ret;
>> >> +
>> >> +	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
>> >> +	if (!auxdev)
>> >> +		return ERR_PTR(-ENOMEM);
>> >
>> > Ick, who cares what the error value really is?  Why not just do NULL or
>> > a valid pointer?  That makes the caller much simpler to handle, right?
>> >
>> 
>> Sure why not

I have tried the 'NULL or valid' approach. In the consumers,
which mostly return an integer from their various init function, I got
this weird to come up with one from NULL. EINVAL, ENOMEM, etc ... can't
really pick one.

It is actually easier to pass something along.

>> 
>> >> +
>> >> +	auxdev->id = id;
>> >> +	auxdev->name = devname;
>> >> +	auxdev->dev.parent = dev;
>> >> +	auxdev->dev.platform_data = platform_data;
>> >> +	auxdev->dev.release = auxiliary_device_release;
>> >> +	device_set_of_node_from_dev(&auxdev->dev, dev);
>> >> +
>> >> +	ret = auxiliary_device_init(auxdev);
>> >
>> > Only way this will fail is if you forgot to set parent or a valid name.
>> > So why not check for devname being non-NULL above this?
>> 
>> If auxiliary_device_init() ever changes it would be easy to forget to
>> update that and lead to something nasty to debug, don't you think ?
>
> Yes, this is being more defensive, I take back my objection, thanks.
>
>> >> +	if (ret) {
>> >> +		kfree(auxdev);
>> >> +		return ERR_PTR(ret);
>> >> +	}
>> >> +
>> >> +	ret = __auxiliary_device_add(auxdev, modname);
>> >> +	if (ret) {
>> >> +		/*
>> >> +		 * NOTE: It may look odd but auxdev should not be freed
>> >> +		 * here. auxiliary_device_uninit() calls device_put()
>> >> +		 * which call the device release function, freeing auxdev.
>> >> +		 */
>> >> +		auxiliary_device_uninit(auxdev);
>> >
>> > Yes it is odd, are you SURE you should be calling device_del() on the
>> > device if this fails?  auxiliary_device_uninit(), makes sense so why not
>> > just call that here?
>> 
>> I'm confused ... I am call auxiliary_device_uninit() here. What do you
>> mean ? 
>
> Oh wow, I got this wrong, sorry, I was thinking you were calling
> auxiliary_device_destroy().  Nevermind, ugh, it was a long day...
>

No worries

> thanks,
>
> greg k-h

-- 
Jerome

