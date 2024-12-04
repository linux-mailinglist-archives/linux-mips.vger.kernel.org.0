Return-Path: <linux-mips+bounces-6871-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 267F09E41C1
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 18:35:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D669F28CC13
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 17:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FE721C18E;
	Wed,  4 Dec 2024 17:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Z03Hk1+3"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AC420E00F;
	Wed,  4 Dec 2024 17:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331857; cv=none; b=Q2jDyUWf62Qj2qGOZFGXnA+0SF4zWUV3VyH6WNjJLg1ivdH8EJGHb3VljKQTBIFNNcqaRLMfJtJB58sO1dQQYL3yftFYRA8yuBPomke6RsFwmgsZSuENKo66ApWnkjy2PmaZokpBlzYOO97OF865S2FiA71RFYhsKEneWCp/YeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331857; c=relaxed/simple;
	bh=L5U4dSkV1I3cWCusRE3BIyX9nk34hT5kxbJWlQQq/1E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=GE3/6PX6XfNhvG0FSJD5EIb483KWOdjqtduDst6IEzXP23WfPfenZwJAlyypDRAk+QlkfOJzocXM/hkSDShaoIZ9sautxlEcT0bvKEN+JraSEV8QQ9E6pvTykjqEoEkhDwua4Lj049G0FbrDEexbViK/LEW0Qw8vthuZjGgdvVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Z03Hk1+3; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 254E2FF808;
	Wed,  4 Dec 2024 17:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733331851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mN4X2mfRbhmCIAyp/AA6+Xam0Nv0+ZB04jq9dio6qPc=;
	b=Z03Hk1+3HTvSePlLeXZJeyZVuM1IupIBCse5Hc0lL7dv7IICVwl/w0x7sHvLL9I6gXO84H
	Y8c6R/6ojaDquwVcHfArTcXDRox6Awc6fyT+pJxqmZojatficEWjltAmRtrI6FylhVTsZV
	/GTrSkg7AQK4qBTHhJ9cfKTNmv4iG7ly/KZz/YGBy4bQotaugMw4Jl/CochHdV/fD99GWf
	rPpknOmjjEv35LL9F1m1Vpxb8Lu+JWdRSnWNYcgsj+DAAMEAGfFUmPfc425h+zlI9i+w+z
	xcTfPy4K4DeUaWflUA9ukblZDdSEE0L/oB58DqEWfNJBLq0UomyIKUmwcHNcaQ==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Dec 2024 18:04:10 +0100
Message-Id: <D632UZERSM8I.1O3J7O9QZ64EV@bootlin.com>
Cc: <oe-kbuild-all@lists.linux.dev>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mips@vger.kernel.org>, "Vladimir
 Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>, =?utf-8?q?Th=C3=A9o_Lebrun?=
 <theo.lebrun@bootlin.com>, "Srinivas Kandagatla"
 <srinivas.kandagatla@linaro.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Nicolas Saenz Julienne" <nsaenz@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
To: "kernel test robot" <lkp@intel.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 5/6] nvmem: rmem: add CRC validation for Mobileye EyeQ5
 NVMEM
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241203-rmem-v1-5-24f4970cf14e@bootlin.com>
 <202412041522.01H5Kj6F-lkp@intel.com>
In-Reply-To: <202412041522.01H5Kj6F-lkp@intel.com>
X-GND-Sasl: theo.lebrun@bootlin.com

On Wed Dec 4, 2024 at 8:58 AM CET, kernel test robot wrote:
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 40384c840ea1944d7c5a392e8975ed088ecf0b37]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Th-o-Lebrun/dt-bin=
dings-nvmem-rmem-Add-mobileye-eyeq5-bootloader-config/20241204-103417
> base:   40384c840ea1944d7c5a392e8975ed088ecf0b37
> patch link:    https://lore.kernel.org/r/20241203-rmem-v1-5-24f4970cf14e%=
40bootlin.com
> patch subject: [PATCH 5/6] nvmem: rmem: add CRC validation for Mobileye E=
yeQ5 NVMEM
> config: arm-randconfig-002 (https://download.01.org/0day-ci/archive/20241=
204/202412041522.01H5Kj6F-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241204/202412041522.01H5Kj6F-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412041522.01H5Kj6F-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/nvmem/rmem.c: In function 'rmem_eyeq5_checksum':
>    drivers/nvmem/rmem.c:66:9: error: cleanup argument not a function
>       66 |         void *buf __free(kfree) =3D NULL;
>          |         ^~~~
>    drivers/nvmem/rmem.c:97:15: error: implicit declaration of function 'k=
malloc'; did you mean 'mm_alloc'? [-Wimplicit-function-declaration]
>       97 |         buf =3D kmalloc(header.size, GFP_KERNEL);
>          |               ^~~~~~~
>          |               mm_alloc
> >> drivers/nvmem/rmem.c:97:13: error: assignment to 'void *' from 'int' m=
akes pointer from integer without a cast [-Wint-conversion]
>       97 |         buf =3D kmalloc(header.size, GFP_KERNEL);
>          |             ^

Will fix with the following.
V2 incoming in a few days to avoid spam.

	diff --git a/drivers/nvmem/rmem.c b/drivers/nvmem/rmem.c
	index 04796f4fa8ae..1f0caf1d2dc1 100644
	--- a/drivers/nvmem/rmem.c
	+++ b/drivers/nvmem/rmem.c
	@@ -9,6 +9,7 @@
	 #include <linux/nvmem-provider.h>
	 #include <linux/of_reserved_mem.h>
	 #include <linux/platform_device.h>
	+#include <linux/slab.h>

	 struct rmem {
	        struct device *dev;

Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


