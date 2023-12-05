Return-Path: <linux-mips+bounces-532-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8825A804BF2
	for <lists+linux-mips@lfdr.de>; Tue,  5 Dec 2023 09:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40C3C281715
	for <lists+linux-mips@lfdr.de>; Tue,  5 Dec 2023 08:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C11C3B789;
	Tue,  5 Dec 2023 08:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="o9zb72wS"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A55B11F;
	Tue,  5 Dec 2023 00:11:41 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id C35C060354;
	Tue,  5 Dec 2023 08:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1701763901;
	bh=5ES838qobdDu8dMPGjH86YPsZ3trJz94Y8IV2r4EIM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o9zb72wSQK+020tfmyFtoECoadFyckZOdPQngTqM80x40ixd9u4S4Df+1hf69TxfO
	 K3pt/kZ2WxWGwqJgCPxAyqWA8MqczSv94DB4Xi1V8NZqglZ+NXCrqxUUDuiwOBjMD6
	 dnqH3MpkvzmLDibfumSoHcSICFTb7FGNRsseQorvWNX58QhvCKdBfP/AYg/eQSLT1e
	 UC2UUuOaXMZb+Xc7iGznXMj+kv3eAbGWYcVZv/X3Zq+7lzZ2tQIDsHJT8f0hLb35og
	 HntMEhegbsnpyNAlq0+RwsjKCFmrpISnapaxscxj12RJQqGgxTlTb0qvgGLIOZ3Kx+
	 ajum/wBX2OyZg==
Date: Tue, 5 Dec 2023 10:10:31 +0200
From: Tony Lindgren <tony@atomide.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andrew Davis <afd@ti.com>, Frank Binns <frank.binns@imgtec.com>,
	Donald Robson <donald.robson@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Adam Ford <aford173@gmail.com>,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	=?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
Message-ID: <20231205081031.GO5169@atomide.com>
References: <20231204182245.33683-1-afd@ti.com>
 <20231204182245.33683-2-afd@ti.com>
 <b97f04f6-cda2-4e9b-b729-a5149e36f978@linaro.org>
 <20231205075657.GN5169@atomide.com>
 <df7dd7b0-f315-4033-985a-175f75568a8c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df7dd7b0-f315-4033-985a-175f75568a8c@linaro.org>

* Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [231205 08:03]:
> What does runtime PM have to do with it? If runtime PM enables clocks,
> these are real signals and not optional.

Runtime PM propagates to the parent device.

Regards,

Tony

