Return-Path: <linux-mips+bounces-530-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC69804B91
	for <lists+linux-mips@lfdr.de>; Tue,  5 Dec 2023 08:58:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 239C9281760
	for <lists+linux-mips@lfdr.de>; Tue,  5 Dec 2023 07:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3191A3399A;
	Tue,  5 Dec 2023 07:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="OvctUa8Q"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D29C8109;
	Mon,  4 Dec 2023 23:57:59 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 9065F60354;
	Tue,  5 Dec 2023 07:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1701763079;
	bh=h3c0XIZu8HbtvK19lq1dOZHqca7qeD59maL/gJhxeU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OvctUa8QMANcluWAdRPNxxmD+MVnpSnWC7upoG4UBmVkldsPZDF5bG4K2pjCO2el1
	 k7PF1jodRp1xIPKpY9F/Sqd++pafBjiWkEUQ93eB4XUu5cBd+RWhmo94eBTBZeIcaf
	 yy6jzlahvKwGQYE/lZ+B0Jk1nAc5YcbFbC7mFp7lYigIiUf9iPyWjV4KXnIgf8oAKP
	 2RfpM3jym7Z1TlujzL9SLs34YjoJm6iXY5wnan1T7/oVqW5nLCnBrE0dt8jw0mjJBY
	 WzQI/kVtk+kMg0wLCQXW/2/tfZJaYH13Z3Ny/NY+o/tE3lOHdj9mEXGAhv57TgpRo7
	 bwBLsWKH9hgaQ==
Date: Tue, 5 Dec 2023 09:56:57 +0200
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
Message-ID: <20231205075657.GN5169@atomide.com>
References: <20231204182245.33683-1-afd@ti.com>
 <20231204182245.33683-2-afd@ti.com>
 <b97f04f6-cda2-4e9b-b729-a5149e36f978@linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b97f04f6-cda2-4e9b-b729-a5149e36f978@linaro.org>

* Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [231205 07:10]:
> On 04/12/2023 19:22, Andrew Davis wrote:
> > @@ -56,6 +76,43 @@ allOf:
> >        properties:
> >          clocks:
> >            maxItems: 1
> > +      required:
> > +        - clocks
> > +        - clock-names
> 
> You need to define the clocks for your variants or disallow them. The
> original code should be fixed as well and make the clocks fixed for all
> img-axe cases.

To clarify, the clocks may be optional as they can be hardwired and coming
from the interconnect target wrapper module and enabled with runtime PM.

Regards,

Tony

