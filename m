Return-Path: <linux-mips+bounces-7773-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 356ECA361D3
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2025 16:35:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6935B1710BD
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2025 15:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464F8266F17;
	Fri, 14 Feb 2025 15:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T7s153Xn"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6A51F92A
	for <linux-mips@vger.kernel.org>; Fri, 14 Feb 2025 15:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739547246; cv=none; b=rKs7BI0ljfkOEH7scuXzPVG0RxHI4si/7KOPCq/UMV0/uFVNMP6FP8jAlTT1V4xPXTEsGi1CLpv6ExmBrEhKVhUV4AnU2valazlmRWjutWTgNvK32mbOA079mpu7xTBA3PFn8Y2GHrQDe+mY+XDuC/fuEDztVdTf6UMYXJZherQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739547246; c=relaxed/simple;
	bh=fHqSVsarbr9/GNSKcHw7mFlABcvHBZA79lxaZw7Ee7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OWgzZycFj0xyQJGRhgQGilmIT0elBHc1sc1nNt60zaokVIYLZBgOUtfwmsQodskg0MH0+aCHXQCP5dopOzLwTw+AT+9kgCrliweIkNp6v55PvCxmC9IDh7Aj/L8fRGeDEwNCAF3a1VPmtKmvYhyaMtBR9y25B3cEbC30wPFH4HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T7s153Xn; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30795988ebeso23401181fa.3
        for <linux-mips@vger.kernel.org>; Fri, 14 Feb 2025 07:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739547242; x=1740152042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHqSVsarbr9/GNSKcHw7mFlABcvHBZA79lxaZw7Ee7Y=;
        b=T7s153XnjxpQ0C07+SONBs1aAY/n4n+PxhZeYe6i96e1BnOeRLKmrIzNot2QCnVjmI
         JRWfFpx5RXZKZOstMRnY8TlJWZqwvRqMq4rc6lM1Hz3Yv+4frfjI02Q5LRCBwvwrTXcM
         Ni64qQ1cOSXbnR/FDS5LWmOg0mumJHcjUruJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739547242; x=1740152042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHqSVsarbr9/GNSKcHw7mFlABcvHBZA79lxaZw7Ee7Y=;
        b=qb9nl/kKIefp6Su1nP35ucVfpFQUbKxrAyAfSWg9vqpkDe2LA46DSsgdkZgNFdheKM
         YBfMxFJmLiZtGlhY8MAyfdgx1mzYMt+1aew5vJjt4C0lt1HeZG6J8jpqbAndRhyM8PNz
         b+NuMBvm4g4+5HcE6uitYypWbCy1T0HlHeKOcQTivuY4ICMFPRNVCELQyp/Go65Guhav
         5hSMPTNlyXNYiKBc0wLNT0V6d1o+agvAaSngTLcBNmiRueiHEDgsLlmeZekHq43tTZdK
         OrdMSiNMjsba+uiL1stxqlVezFS8puXK+tx3Y/75fGTjUFHp7MmzO8LDPE40NUpgOWK5
         ZWzA==
X-Forwarded-Encrypted: i=1; AJvYcCV2AYf9VOG7BdZIk95116waX5Oup25TNfNLmcCakqz0PtweJ38uRuswbMGi1lMjzPRYhSFiN186TFH6@vger.kernel.org
X-Gm-Message-State: AOJu0YxTTqZ4KGhPyBL13f1CuKKG5BRX7n8ebz2OAIpHmqQ8PK6YzHjO
	4+Y1M3zpZMzvNIEQbDMHChhoOZB9+fwi9WzUwLwO1VbUATr/RmpodJSk7EGSTQr8ieyn0IKdh04
	8Rg==
X-Gm-Gg: ASbGncswkISmD67uS2ITw3kyNIynOF7kWVBTC+WPTVKqumjsehU/6+GCoIpic5226nB
	DgelsbSunoqM33ZHKOXa2tFruBXN0nKW/13pUDr0vYZAyIcbMNN40MqBdu+EWa3QPLIUY2BH96v
	ivdyAwDu4UtTCILv+VSBLGbeZ8V805wJPkwFLgJ0QRqkNkOZT+ag8pcQJRxt9vN4TGRJJ9V5dh5
	MyWBFc0pttJOUSzGRFED7yjCmvkahzoYz811Lcl3owd6+Gnmut62x50QPQDE4KdRjtNu+jkMddG
	ftw2UrIVByQLGXGWlkJ7N6P/SY6h4/JGholLJoNosgcm/95cJvgTl34FHSI=
X-Google-Smtp-Source: AGHT+IF3HUp/a6n4SHDHfmn5/HTX1Gvp5d2XN71BS0hxWo8pFFeOYPujBhkbmDFC9V94qMXNG+nihQ==
X-Received: by 2002:a05:651c:b14:b0:308:e54d:618a with SMTP id 38308e7fff4ca-3090ddbfae1mr22690361fa.29.1739547241573;
        Fri, 14 Feb 2025 07:34:01 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309100eabcbsm6055951fa.24.2025.02.14.07.34.01
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 07:34:01 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-309191eec90so12332521fa.2
        for <linux-mips@vger.kernel.org>; Fri, 14 Feb 2025 07:34:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX80OutRs/vj3mme7/jqaN9AvikQPb1UXkJCczzFo/ucGc52vdnz+TFKvYVm8oSVdRfxMJsRA25lgmC@vger.kernel.org
X-Received: by 2002:a2e:8a97:0:b0:308:eb58:6581 with SMTP id
 38308e7fff4ca-30914801891mr14311001fa.0.1739546770563; Fri, 14 Feb 2025
 07:26:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-2-7edb50524909@baylibre.com>
 <20250213-crown-clustered-81c6434c892b@spud> <1jv7tczytk.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jv7tczytk.fsf@starbuckisacylon.baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Feb 2025 07:25:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VeSrZktEbxNXXTgD80QGTpW5b-WiXUFko+a8FUzmN+fQ@mail.gmail.com>
X-Gm-Features: AWEUYZn5Dl35ky148QOOCnARP_86rg2vhIKgVTUOs7s9KbdYhXOWWeRWr_r9yF0
Message-ID: <CAD=FV=VeSrZktEbxNXXTgD80QGTpW5b-WiXUFko+a8FUzmN+fQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] reset: mpfs: use the auxiliary device creation helper
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Conor Dooley <conor@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Danilo Krummrich <dakr@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 14, 2025 at 12:59=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
>
> > One think that's always felt a bit meh to me is this id number stuff,
> > I just threw in 666 for meme value.
>
> :)
>
> > The whole thing seems super
> > arbitrary, do any of the users of this helper actually put meaningful
> > values into the id parameter?
>
> In example changes I've sent, no.
>
> In other simple usages (those using container_of()) of the auxiliary
> bus, I think there are a few that uses 0 and 1 for 2 instances.
>
> I guess your question is "do we really need this parameter here ?"
>
> We could remove it and still address 90% of the original target.
>
> Keeping it leaves the door open in case the figure above does not hold
> and it is pretty cheap to do. It could also enable drivers requiring an
> IDA to use the helper, possibly.

FWIW, once you resolve the conflicts in drm-misc with ti-sn65dsi86
you'll need the ID value. ;-)

There was a big-ol' discussion here:

https://lore.kernel.org/r/8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.17291804=
70.git.geert+renesas@glider.be

I eventually pushed v2 of the patch:

https://lore.kernel.org/r/7a68a0e3f927e26edca6040067fb653eb06efb79.17338400=
89.git.geert+renesas@glider.be


-Doug

