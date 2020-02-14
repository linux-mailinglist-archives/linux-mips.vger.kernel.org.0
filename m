Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA7215F673
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2020 20:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388011AbgBNTKi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Feb 2020 14:10:38 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:58624 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387605AbgBNTKi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Feb 2020 14:10:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1581707435; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TAiS2jYAHYbz6sUAhqIh9UKM3iu7+r/pmnppfM3rHqU=;
        b=WobT/OnZYAUEs4Nc4TOqp4Sm2qflko6z2DkafPikKQfBhoVoo6BfWn2869RvoI2nZ2tQ4M
        oY8BydVknWqKe23bED7frFgMlFN1x5HAX1JetPw6nwg66ZG9JB7SjW/khkD/XRQKOxtFgL
        4i+rs4o33F2wkh0B70Sr7PyXN5lfuv8=
Date:   Fri, 14 Feb 2020 16:10:15 -0300
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 03/12] MIPS: CI20: defconfig: configure for supporting
 modules
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Boddie <paul@boddie.org.uk>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andi Kleen <ak@linux.intel.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Kees Cook <keescook@chromium.org>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Message-Id: <1581707415.3.7@crapouillou.net>
In-Reply-To: <db4db9e0b024aa3051a6f1f7be07323418d1d453.1581696624.git.hns@goldelico.com>
References: <cover.1581696624.git.hns@goldelico.com>
        <db4db9e0b024aa3051a6f1f7be07323418d1d453.1581696624.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nikolaus,

Patches 03-12 only touch the same two files - ci20.dts and=20
ci20_defconfig.

Unless someone strongly disagrees, I'd suggest to squash all patches=20
that touch each file together (except the ones with a Fixes tag), I=20
don't think we really need that much granularity here.

-Paul


Le ven., f=E9vr. 14, 2020 at 17:10, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Not all drivers need to be compiled into the kernel.
> Support building and loading of kernel modules.
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/mips/configs/ci20_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/mips/configs/ci20_defconfig=20
> b/arch/mips/configs/ci20_defconfig
> index be41df2a81fb..e0d3c9d4c2ae 100644
> --- a/arch/mips/configs/ci20_defconfig
> +++ b/arch/mips/configs/ci20_defconfig
> @@ -1,4 +1,5 @@
>  # CONFIG_LOCALVERSION_AUTO is not set
> +CONFIG_MODULES=3Dy
>  CONFIG_KERNEL_XZ=3Dy
>  CONFIG_SYSVIPC=3Dy
>  CONFIG_POSIX_MQUEUE=3Dy
> --
> 2.23.0
>=20

=

