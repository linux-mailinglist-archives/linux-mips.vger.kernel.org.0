Return-Path: <linux-mips+bounces-7750-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CA7A32923
	for <lists+linux-mips@lfdr.de>; Wed, 12 Feb 2025 15:51:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B0951606E8
	for <lists+linux-mips@lfdr.de>; Wed, 12 Feb 2025 14:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9FB211463;
	Wed, 12 Feb 2025 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="U6fKO9ZN"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0FB21127E;
	Wed, 12 Feb 2025 14:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739371901; cv=none; b=qKiBz0MvvRhovXqAqtVd4UXgvx/Lr2+/3e/nHt7jklOYriuL2fjeb4pyT2S9rHoueLajj8stfSa6mvK5DO67TI6ZjebObUlGD02IFMzljRAmlAN+js7SVRF/b9HMTQa2Bb7dYlIBvnqI3QNpAIp8+AloGSM3cukNIRihe/We09o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739371901; c=relaxed/simple;
	bh=3D5jTxu4ZxbcqJgUxTp0ZDvRAq7lWG2tJ7vUZuiqwlE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=h13OXknQ+195vF+1pzTld8yQH7P8hvUsRU3I5DBywtiP5ycl4KUxIqfAIzs5TdNnlg2qGOpADD7pzNM0pMxlzGNNqwoamRlJ4bA5Q3VHqiI5sGfzr6FI//CsWTxL7rDorudgdc/P6yg60++t01jt993g/3SsrTHnW4LWnVUgy/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=U6fKO9ZN; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED301443C0;
	Wed, 12 Feb 2025 14:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739371896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/S4xKTURHeontyYyIzF3UhaW4swbeEI4cyVPn5z26I=;
	b=U6fKO9ZNbkAvP9nETMzRxyvHoJnDJ7jaL/OauAXgoJPMATOp1FY+sVOfPlMNUxnUwPF6wg
	ZlD1LL6+ruLQa/f/nipAbKXCBiyDhkoBKm2hg3F5q7eMNluI30OaarujKUXId0RW8W2poo
	L15MihjxtV2AhfLqaM/Nye/6p/7KfLRJ/D9ueWjthDftoiak+mzn6bkQ3jbOXG+earg0Lq
	WGBujDNU7bu/gcKYQ2Hxd4lTxNlnY6rDVTSn0P+pNXRyze2oUjfbPKHWCtplhtHE82U6rD
	3PmD9mHPj6cZqFOqmcE0bWszE+WUhefQydOPqfYL4e1fb+XBR9TNAukWimuPvQ==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Feb 2025 15:51:32 +0100
Message-Id: <D7QJVKCWO1C0.2GIZNZ9FUF96I@bootlin.com>
Subject: Re: [PATCH v3 5/7] clk: eyeq: use the auxiliary device creation
 helper
Cc: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <dri-devel@lists.freedesktop.org>, <platform-driver-x86@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>
To: "Jerome Brunet" <jbrunet@baylibre.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Dave Ertman" <david.m.ertman@intel.com>,
 "Ira Weiny" <ira.weiny@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Stephen Boyd" <sboyd@kernel.org>, "Arnd Bergmann" <arnd@arndb.de>, "Danilo
 Krummrich" <dakr@kernel.org>, "Conor Dooley" <conor.dooley@microchip.com>,
 "Daire McNamara" <daire.mcnamara@microchip.com>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Douglas Anderson" <dianders@chromium.org>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Hans de
 Goede" <hdegoede@redhat.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, "Michael Turquette"
 <mturquette@baylibre.com>, "Abel Vesa" <abelvesa@kernel.org>, "Peng Fan"
 <peng.fan@nxp.com>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Kevin
 Hilman" <khilman@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com> <20250211-aux-device-create-helper-v3-5-7edb50524909@baylibre.com>
In-Reply-To: <20250211-aux-device-create-helper-v3-5-7edb50524909@baylibre.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggedujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefvhffofhgjsehtqhertdertdejnecuhfhrohhmpefvhhorohcunfgvsghruhhnuceothhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudetledtveejvdekleeujefhvdelieeutedvgfevffffkeeugefhhfeiudeljeevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeeipdhrtghpthhtohepjhgsrhhunhgvthessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepuggrvhhiugdrmhdrvghrthhmrghnsehin
 hhtvghlrdgtohhmpdhrtghpthhtohepihhrrgdrfigvihhnhiesihhnthgvlhdrtghomhdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgsohihugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Jerome,

On Tue Feb 11, 2025 at 6:28 PM CET, Jerome Brunet wrote:
> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
>
> Use it and remove some boilerplate code.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Tested the series, it works. However:
 - The newly introduced helper does a
   device_set_of_node_from_dev(child_device, parent_device) call which
   used to be done by our reset-eyeq child.
 - reset-eyeq also did a WARN_ON(dev->of_node) to validate it didn't
   have an OF node at probe (checking its assumptions).
 - We can remove both. See patch that got sent as a reply.

With that additional patch:

Tested-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>  # On Mobileye EyeQ5

Note: Philipp Zabel has been CCed on the patch and this email as the
reset maintainer.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


