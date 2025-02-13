Return-Path: <linux-mips+bounces-7761-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B0FA34075
	for <lists+linux-mips@lfdr.de>; Thu, 13 Feb 2025 14:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09A733A75CE
	for <lists+linux-mips@lfdr.de>; Thu, 13 Feb 2025 13:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B282A23A986;
	Thu, 13 Feb 2025 13:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Kwt7lkya"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC3723F439
	for <linux-mips@vger.kernel.org>; Thu, 13 Feb 2025 13:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739453762; cv=none; b=jool9YTgkiKG7WG6xS9GW7j5zLmoE2wijELyjSblrDIRQSCe1giIXkibSnx4NKn1U8e2nInukzLlckk8LpNapJt1X+k5hYhf84QSVbDD7mNnwUN0jbHPz36hTNOZyMg31mblbb1FPxVPI0wIvR+PkX149xR4AkeSrUooOnZyhEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739453762; c=relaxed/simple;
	bh=yVvqosbfBaZN59lYnyfV7wTLt5V4gEraGzYMEdvy9dQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZuWkd3NciHORxjbvyJ3Fq8QseBfv3e+h2s+JpQVSTDrw/46DyH38xqB0of+6ABswVfpKbFnF2m/cJCfhZzPLorEB4mUuiKJYWzqsBv8JLJXgQkvuXkps8rBIe0NhnY1bEUC9h8TuZABUZ+oedbrn1p/KPXo+YgiVzKbFjKBkIto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Kwt7lkya; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4395a917f33so11128215e9.1
        for <linux-mips@vger.kernel.org>; Thu, 13 Feb 2025 05:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739453759; x=1740058559; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4lyrHtSipeKghn9xCx+8COWh0BWty29N6DnBPAUwOek=;
        b=Kwt7lkyaR7i6RrsjyNhunBJrvwQ8PXiwnQrRIwvma4UE9b7JHJrXhnWmKdcHFUd412
         vgm9xVjTo4qjZ/7U96UoghzM4axpKsuVKDaGOsPAg1CAU5hd6tl8gh4QSYcueulLlTHu
         FOFu3Md9p8T/s9a0/YQyUG/UOD3FVUaXvm8N22vT6JNGk/nWq/9a0J/HyI9gZBY9p7ZQ
         82VSje2duFX2/HKYxhCsKl0XibsWajIn52wj4a+mulVCLFUTii/5xS/04GoYzQkwpuIr
         4K0edys8eZrTSRk52uIyTxC96ieJjwefLQETEldsFGRnnjeL71qnfYv+L1h529jznoOG
         8kZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739453759; x=1740058559;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lyrHtSipeKghn9xCx+8COWh0BWty29N6DnBPAUwOek=;
        b=YWQcuWBp6KqXrK3eY3P2KSk6u6sP1esPI65RQEf8tbbYVpZqT/seVUGOCFJtL954Ha
         5qiLS5L58k/oEuQSrpzN1lWYxiIbXWjUx8XY8u0mFCdCKRz9DrYiOQEC0d0g8OyX6ZEU
         ALfVfrBmR67KevOu8nS1YIjXgV/sZEWrlI676yXBhNgS6Shh5mR1OwVZ7dyfUMDgQZ7T
         9KVDhNM2OrBGG6tv+Rsll8VS/Tc2z70mLVgznIOBWYae/CHVesQdpHVKrfRv6+88s4oa
         NqBJv/LOq+EaRLClzw6/1+FUxMTqTj2SrFqd8idjOjU0BUeZ0hgfij1EPq5F5W68SdvQ
         owbw==
X-Forwarded-Encrypted: i=1; AJvYcCXildqtxmxxYv+z6JHUQmWK29QMI9qZprT3NsCAcJkj26avGZVBG3rFDwbKLKoiHlPCZrgLqBSOuoQR@vger.kernel.org
X-Gm-Message-State: AOJu0YzXlsQ2cJ915rA6CEje34QKmNK5yDUc+OwWqwMeDrVJoO2EvYd3
	CRLfoHdlbG4CGMOF85CzmCZNhW+xOVEA5UiHoO0vax+wCVTfr6A0NjCWlGOhQQ8=
X-Gm-Gg: ASbGncv9fcNnDEt0nm12c5vEiY07Ynrs5neDvddF4p0h2MUTIW/narTlGUGO4tk0USl
	+76QIhqNERm8uehg1xxPtt9l2AbwXbueqJ+V0XRnKj2n9Ji9+6I89iQpjtvHEdbETRMefmv6mMR
	KDF1VVBcLBj9q/8WaiqCt38zH1j+5B9faprb6rHhAAnltJB9qG+epM23Ynf4P4MAJSyuOSMMIl0
	lBEE8k9MkI6xbFN19SfkP2la3G+1gpzlwuab5NajeTch2/yHd+26iAGi/eF2r2ppR30XgFsbqVv
	r/QAI5KoThRx9Q==
X-Google-Smtp-Source: AGHT+IFlyyROQN/jp5N25OPHAwGGncnJ/FLwqH6qkR/P/8dmal2Zk5G/l0wZieziiMnBJNT5H1Y22g==
X-Received: by 2002:a05:600c:a0c:b0:434:f1bd:1e40 with SMTP id 5b1f17b1804b1-43960e81b92mr29235125e9.6.1739453758160;
        Thu, 13 Feb 2025 05:35:58 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b617:2c1:fc8c:2705])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a056151sm49618825e9.16.2025.02.13.05.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 05:35:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,  "Dave Ertman"
 <david.m.ertman@intel.com>,  "Ira Weiny" <ira.weiny@intel.com>,  "Rafael J
 . Wysocki" <rafael@kernel.org>,  "Stephen Boyd" <sboyd@kernel.org>,
  "Danilo Krummrich" <dakr@kernel.org>,  "Conor.Dooley"
 <conor.dooley@microchip.com>,  "Daire McNamara"
 <daire.mcnamara@microchip.com>,  "Philipp Zabel" <p.zabel@pengutronix.de>,
  "Doug Anderson" <dianders@chromium.org>,  "Andrzej Hajda"
 <andrzej.hajda@intel.com>,  "Neil Armstrong" <neil.armstrong@linaro.org>,
  "Robert Foss" <rfoss@kernel.org>,  "laurent.pinchart"
 <Laurent.pinchart@ideasonboard.com>,  "Jonas Karlman" <jonas@kwiboo.se>,
  "Jernej Skrabec" <jernej.skrabec@gmail.com>,  "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>,  "Maxime Ripard"
 <mripard@kernel.org>,  "Thomas Zimmermann" <tzimmermann@suse.de>,  "Dave
 Airlie" <airlied@gmail.com>,  "Simona Vetter" <simona@ffwll.ch>,  "Hans de
 Goede" <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>,  "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>,  "Gregory Clement"
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  "Michael Turquette" <mturquette@baylibre.com>,  "Abel Vesa"
 <abelvesa@kernel.org>,  "Peng Fan" <peng.fan@nxp.com>,  "Shawn Guo"
 <shawnguo@kernel.org>,  "Sascha Hauer" <s.hauer@pengutronix.de>,
  "Pengutronix Kernel Team" <kernel@pengutronix.de>,  "Fabio Estevam"
 <festevam@gmail.com>,  "Kevin Hilman" <khilman@baylibre.com>,  "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 7/7] clk: amlogic: axg-audio: use the auxiliary reset
 driver - take 2
In-Reply-To: <73c1ab6b-fd5e-47e3-8815-8f74758535f1@app.fastmail.com> (Arnd
	Bergmann's message of "Thu, 13 Feb 2025 13:26:12 +0100")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
	<20250211-aux-device-create-helper-v3-7-7edb50524909@baylibre.com>
	<73c1ab6b-fd5e-47e3-8815-8f74758535f1@app.fastmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 13 Feb 2025 14:35:56 +0100
Message-ID: <1j1pw20xxf.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 13 Feb 2025 at 13:26, "Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Feb 11, 2025, at 18:28, Jerome Brunet wrote:
>>
>>  I also think this is more readeable and maintainable than a bunch of
>>  'default CONFIG_FOO if CONFIG_FOO' for CONFIG_RESET_MESON_AUX. This approach
>>  also would have several pitfall, such as picking the value of the first config
>>  set or the config of RESET_MESON_AUX staying to 'n' if CONFIG_FOO is turned on
>>  with menuconfig.
>
> I still think you should just drop the 'imply' line, all it does it
> force reviewers to double-check that you didn't make a mistake
> here, so it's a waste of time.

Arnd, you've made you preference clear and this note has been added
specifically for this reason, and transparency. 

I've exposed a technical reason for my choice. Going with the 'default'
approach makes things more difficult in the long run for those
maintaining this platform, me included.

The trouble of having to coordinate changes in 2 different subsystems to
have an appropriate configuration and the pitfalls of using 'default'
outweigh the extra review trouble of using 'imply' ... especially when
the pitfall mentioned in documentation is explicitly addressed in the
description.

If there something wrong with 'imply' existing and being used, maybe the
Documentation should be updated to reflect this, or the support be
removed entirely.

ATM, it exists and it makes things a lot easier for me to support and
maintain this device.

This all started with a maintainer request to move some resets away
from clock. More requests have been added along the way, making things
more generic. I'm more than happy to have contributed my effort and
time on this and I don't think anybody's time has been wasted so far.

>
>     Arnd

-- 
Jerome

