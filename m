Return-Path: <linux-mips+bounces-9196-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C44AD1E6D
	for <lists+linux-mips@lfdr.de>; Mon,  9 Jun 2025 15:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4035B188D408
	for <lists+linux-mips@lfdr.de>; Mon,  9 Jun 2025 13:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436CD2580FE;
	Mon,  9 Jun 2025 13:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YHFjckwr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74D02571A2
	for <linux-mips@vger.kernel.org>; Mon,  9 Jun 2025 13:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749474152; cv=none; b=t8pKJ+voriTLejtwRp67zRQn5frfdLUDN/iXG1NLgVX7tEAD7eGgoCK7C+0EaA24zcnW0IcFzh2v1XlI7sbY0Mu4JW/zfLmE2yiYg953aSn3BdDmKdSgdexfnXFmxFR226Kn/QskVj3I+LxAUg6EStxH37ihDxfUCsvalYEALaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749474152; c=relaxed/simple;
	bh=ExaMzXZlSuKQlxahihw/nEqvNxngY52zmmzw4dDOOOY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TTtCT8Kpuh+wprEMVJLQbsph2p5VXKUMIsNYkOsx84fQLyWD02vGTCWeyhqp1hGBgjStqgoxPSxOmPGX+wOIifUrTLVPpo6aQnRlWAomoeUhpOww83k1CtaIc7d+VM6zLAWNEQaL6dSxzAkkURLzK5Qc1Tfl52Y1g1Ks3kRqQQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YHFjckwr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-452f9735424so8971815e9.3
        for <linux-mips@vger.kernel.org>; Mon, 09 Jun 2025 06:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749474147; x=1750078947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Bh+Zp7cUZNAenLGdWusNvBpvA8IMsAYVSOUkU7ta8Y=;
        b=YHFjckwrloVFpaai0XMvPHcSDBbd3+Klh/KkyQhzO38FvylsbztPr3aQd59bcVrNuZ
         SCILXznlLXOqXV6rKvYihLrWO5vJWcZ5jJkmgIUgCcVn+oW9qA+UPiGhtFS8c8ExCxBF
         sQ6dPdjVsZsaOaZD5oykEBSugYfCwRW9ylL9UxLFdUitlCrnAwQh4z2+YeIU5GOIqX8R
         uMcKp+dBeoeDXINMTd+Xz0Cj6N20NFv0E85wlA6rtzihaURUdfLmX3GY0pPwxw+S0sLq
         FXSH2+u3RRDY1sDNLgMaC3l0VuPMPMfTmLKrELdsJOW+LfVRSBmzfaADHgzYFAM9c2Fr
         TL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749474147; x=1750078947;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Bh+Zp7cUZNAenLGdWusNvBpvA8IMsAYVSOUkU7ta8Y=;
        b=cRChRz6p52hzJ9dFQeuvrtBQKVRf0XHntsmh6D9TBzbNBBhLp51XYISUmDYhgZ4gkq
         BN5dpdOF26WGv5BX3ljC0nAGx+hRE7htZRqc6tpmw0ovaB2GJ4IY6If3bC9iBUSDxl95
         27dAs3d1BT8cQamaVRe/JCVWzU4ceavmWFbmmC3qJzeiAIFowl9gtUAk5K9gWVPjI3OF
         QJr4pwP3Qruu62fQMOVPtfHoVj2S4wyYSGsHYdB6mhaAk8zd+9pSAv+86dERwjD7WJ4O
         9wkUwRfdUzKSlJ31oCxcTUsK3WOrQPKEdO90YOfXy/RD9DmXW8MOTTvvZvQkcgbvs6P4
         asmA==
X-Forwarded-Encrypted: i=1; AJvYcCXbpFi4VKE/rS7VHzZahBflaHo6iDQymAt+bN8S+FfwIDm/S+0UVvLJyYRoBXiONwWy7dXgtE4NgDsX@vger.kernel.org
X-Gm-Message-State: AOJu0YxDPYYb2+j6RL77OO+FTsN9V1GUtvV52LTWrRIZlwFvcPFn49JK
	KKWaZwFiUsd9W+EsfMu7ui08AujFforaNZBoPFtlZjUjr6QHKSWnNCRVLldnDv4pLPg=
X-Gm-Gg: ASbGnctVoFWUkemGDt1aP8mQ1L3NRy/rlB9kf2gEHIRRzKYPuHVHVYoO7xzeZfKKgOw
	VgER1DmxFP+1C4yM8yqu0qvIS0xMHk+RKL4Qa46BroG5XCOYdX7lzSOdMomRuR4y1QrWPi42Ozj
	SoWX00HwsyWub42mw3nnLLaqzFOqzd2oChOI2KTa42mnPtn46Qs3EnI365Thobv1xU+/UMX8eKa
	SwdGMHB6u4Jd73CdK2TrG1l1KLmq0iL4rYmO7/dcROoBhmp4pC1QYReNKz0TjEfMpPiUV55JViv
	JQtxMJlhUZtIeGWnRFxAWMZkPj5d6AfOg337xrA8KsVEQKITmjk=
X-Google-Smtp-Source: AGHT+IEC224y8+mr5qcnD9k9Q2VLvv7fn9ojcXNf/BK82QyxQgrEFMVWAZeFnV10+zDndt5WfXGhRg==
X-Received: by 2002:a05:600c:34ca:b0:453:1058:f8c1 with SMTP id 5b1f17b1804b1-4531058ffa6mr39477275e9.3.1749474147101;
        Mon, 09 Jun 2025 06:02:27 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1008:ff30:c454:e59e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-452137290b9sm110888675e9.34.2025.06.09.06.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 06:02:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Dave Ertman
 <david.m.ertman@intel.com>,  Ira Weiny <ira.weiny@intel.com>,  "Rafael J.
 Wysocki" <rafael@kernel.org>,  Stephen Boyd <sboyd@kernel.org>,  Arnd
 Bergmann <arnd@arndb.de>,  Danilo Krummrich <dakr@kernel.org>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
  Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  "Bryan O'Donoghue"
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
Subject: Re: [PATCH v4 3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
In-Reply-To: <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
	(Doug Anderson's message of "Tue, 25 Feb 2025 08:04:57 -0800")
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
	<20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
	<CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 09 Jun 2025 15:02:24 +0200
Message-ID: <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue 25 Feb 2025 at 08:04, Doug Anderson <dianders@chromium.org> wrote:

> Hi,
>
> On Tue, Feb 18, 2025 at 11:30=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.=
com> wrote:
>>
>> The auxiliary device creation of this driver is simple enough to
>> use the available auxiliary device creation helper.
>>
>> Use it and remove some boilerplate code.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++-----------------------=
-------
>>  1 file changed, 7 insertions(+), 42 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'll snooze this for a bunch of weeks and check back to see if this
> can be landed in drm-misc-next every once in a while. If you notice
> that drm-misc-next has the necessary patches before I do then feel
> free to poke me and I'll commit it.

Hi Doug,

FYI, this is safe to take with v6.16-rc1.
Please let know in case you prefer a resend.

>
> -Doug

--=20
Jerome

