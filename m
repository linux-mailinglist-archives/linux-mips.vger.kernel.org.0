Return-Path: <linux-mips+bounces-7756-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 294FCA33C7C
	for <lists+linux-mips@lfdr.de>; Thu, 13 Feb 2025 11:20:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21CFD16A35C
	for <lists+linux-mips@lfdr.de>; Thu, 13 Feb 2025 10:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFBD22163AD;
	Thu, 13 Feb 2025 10:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="baYxDlmE"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA662153F4
	for <linux-mips@vger.kernel.org>; Thu, 13 Feb 2025 10:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739441791; cv=none; b=LX+BIOzvgGZ4n5Y0/YWt3dV8618s0bckStA26eYV+HGdAywUbjGjMSc6Mr3epSOvYZ6m0ioKWTNkX7FAvvBILL/KcWb38uy/0hvNqnVql0WhF1daUFtDheSyR9NAsKMv2kdl0WCv6aKtkBep2I5evsa46pM26oK5cIA3ooIGUg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739441791; c=relaxed/simple;
	bh=xmBDEx12/MlSpiH6V4WRagCuKEu5iUiwWGczemVxZ74=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XC+QFPDCicDcbHhGu/v6NVy46cTNyn9Zbphq1fgSf93cgKL+1Ns1xT98hIuCyIHszUoGVO8q96qL5b+DMp/GaQvoRer9eBnGTZFNkYIgsVeX88OxU5NIbVmi/n3GTwEkoOAd0ss7OLWih3euKfxsAkwoaQEp8lSp6oLIdwrYGv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=baYxDlmE; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38dd91c313bso344798f8f.3
        for <linux-mips@vger.kernel.org>; Thu, 13 Feb 2025 02:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739441787; x=1740046587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmBDEx12/MlSpiH6V4WRagCuKEu5iUiwWGczemVxZ74=;
        b=baYxDlmEYIYvjfbu4jxW8q+NipL4xiZzYboYksA07dYyC/9+JEBKzgZ121waBA1QzK
         TTceqAW87LKEBjGo+NGh/r7H5TwGcK3hjbiQMnJdKL7Uo9smDwE8zpaZCJRHDvgsLSPx
         hUCWXEx+872+qjNfzWL42GE55KPXCCbsloGM+ZMmxG5AIOtXthF2sreQoq5aq7FoovhB
         5HBUIFPQVDaNQtgtoZAakH2ejW5TyNE+jD4zKdWPVCcUSW6aOxFgk8VGJfQATww5mQaU
         vKoNZJIYOFk4LRYA9skQPjAPwngn7lS3bpHUeJntCndndGpgHev2xXY8LigkonNYcOY2
         ayEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739441787; x=1740046587;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xmBDEx12/MlSpiH6V4WRagCuKEu5iUiwWGczemVxZ74=;
        b=eqmR5v0i8LGGAHk4udZ2ZtDAog9bhw0nmW18z+Pd/Lm+WOa6A4jiCPysZjAd4OGPsT
         EoKVD4mRhivc+knQwOT8RDlr5idDhuJ544WRKPgm/rOQR+RSozwzze7ELh2ZABwYaZ+/
         1UveD7CxOgIbTvEU50/r0i5Wsang3zyZpSmWSrlwc5OQJuz7hg4SWO7HkNSI7xVIpIf7
         eKA90Tf/bgY2ONKqdu6EaKPa6EWoSLnOag6XnzKoO3sR+f5gb//qTB/R/nC06KF0W+yT
         gviVayj63xnSzNJfLtiuDV+RbPb+ff5OdRK9vhWJujpGiy7vBP5nWct9qThHZfzunGLe
         qeVg==
X-Forwarded-Encrypted: i=1; AJvYcCUgvI1uoiZUF9leWC+uSkk1nTMD0S8mcYmYZ2sl3Ay5jz/nYOMQavV6mz475SIoULz+OlOi38UlZXbV@vger.kernel.org
X-Gm-Message-State: AOJu0YwRRAH678nWyKp067H0xrmdF+S0wcZ6V15ARNJhc/k7JLx5hA8N
	syRt4Li+3JS8RjtnQat2gVKug9txVG80fK9ICq2Q6O5Acbt00DZZDCzcLOyfYB8=
X-Gm-Gg: ASbGncsdFBQBLU+dUpU9ME4yUKwUh7HK16hExyKuRBjmnNfGLI7VyAMwWhxkDPzSKgF
	3378gwuWZfMErm21UA4B84iQMZNIjiT/TcJnExA+wJYa5fsIzbNyQOO1QaZRad1qF2YKJ6URi1f
	QaERBWPrD60x00WeqSXDpRH3E7c0sNIyY0Smn01gaoSSB6MQJUbODqsTV18p65VZLmbgq3AM/+M
	1nIT5FKkeit2ESzCVA/PoK5L+Y6BE85IfYOowOkAAmaGS8b+g4PJvC6FeHGl5Lx+K3UDCVgiDer
	v2eUKQ5wNM26Pg==
X-Google-Smtp-Source: AGHT+IEffmNN4Pb9+ARCo3GKUiuLAJbsEVpvuLGQpUwyPZc6Fg0ln2kIswpBpy9K/UypDXBJlkii1A==
X-Received: by 2002:a05:6000:1884:b0:38d:d8d1:a4e1 with SMTP id ffacd0b85a97d-38dea3c42dcmr5386478f8f.4.1739441787185;
        Thu, 13 Feb 2025 02:16:27 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b617:2c1:fc8c:2705])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm1451341f8f.94.2025.02.13.02.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 02:16:26 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: =?utf-8?Q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,  "Dave Ertman"
 <david.m.ertman@intel.com>,  "Ira Weiny" <ira.weiny@intel.com>,  "Rafael
 J. Wysocki" <rafael@kernel.org>,  "Stephen Boyd" <sboyd@kernel.org>,
  "Arnd Bergmann" <arnd@arndb.de>,  "Danilo Krummrich" <dakr@kernel.org>,
  "Conor Dooley" <conor.dooley@microchip.com>,  "Daire McNamara"
 <daire.mcnamara@microchip.com>,  "Philipp Zabel" <p.zabel@pengutronix.de>,
  "Douglas Anderson" <dianders@chromium.org>,  "Andrzej Hajda"
 <andrzej.hajda@intel.com>,  "Neil Armstrong" <neil.armstrong@linaro.org>,
  "Robert Foss" <rfoss@kernel.org>,  "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>,  "Jonas Karlman" <jonas@kwiboo.se>,
  "Jernej Skrabec" <jernej.skrabec@gmail.com>,  "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>,  "Maxime Ripard"
 <mripard@kernel.org>,  "Thomas Zimmermann" <tzimmermann@suse.de>,  "David
 Airlie" <airlied@gmail.com>,  "Simona Vetter" <simona@ffwll.ch>,  "Hans de
 Goede" <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>,  "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>,  "Gregory CLEMENT"
 <gregory.clement@bootlin.com>,  "Michael Turquette"
 <mturquette@baylibre.com>,  "Abel Vesa" <abelvesa@kernel.org>,  "Peng Fan"
 <peng.fan@nxp.com>,  "Shawn Guo" <shawnguo@kernel.org>,  "Sascha Hauer"
 <s.hauer@pengutronix.de>,  "Pengutronix Kernel Team"
 <kernel@pengutronix.de>,  "Fabio Estevam" <festevam@gmail.com>,  "Kevin
 Hilman" <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  <linux-kernel@vger.kernel.org>,
  <linux-riscv@lists.infradead.org>,  <dri-devel@lists.freedesktop.org>,
  <platform-driver-x86@vger.kernel.org>,  <linux-mips@vger.kernel.org>,
  <linux-clk@vger.kernel.org>,  <imx@lists.linux.dev>,
  <linux-arm-kernel@lists.infradead.org>,
  <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH v3 7/7] clk: amlogic: axg-audio: use the auxiliary reset
 driver - take 2
In-Reply-To: <D7QJX632CRCV.P0ZI0WWT083Z@bootlin.com> (=?utf-8?Q?=22Th?=
 =?utf-8?Q?=C3=A9o?= Lebrun"'s message
	of "Wed, 12 Feb 2025 15:53:38 +0100")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
	<20250211-aux-device-create-helper-v3-7-7edb50524909@baylibre.com>
	<D7QJX632CRCV.P0ZI0WWT083Z@bootlin.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 13 Feb 2025 11:16:26 +0100
Message-ID: <1ja5aq175x.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed 12 Feb 2025 at 15:53, Th=C3=A9o Lebrun <theo.lebrun@bootlin.com> wro=
te:

> Hello Jerome,
>
> Why the " - take 2" in the commit first line?

Because, at the origin of the dicussion for this patchet, there was
another change doing the same thing [1]. The change was reverted do
perform some rework and now it is back. It was another series entirely
so v2, v3, etc ... did not really apply well.

Just giving a change to people using google or lore to distinguish the
two, that's all.

[1]: https://lore.kernel.org/lkml/f9fc8247-331e-4cdb-992e-bc2f196aa12c@lina=
ro.org/T/#m9ab35b541a31b25bdd812082ed70f9dac087096e

>
> Thanks,

--=20
Jerome

