Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDDA168E56
	for <lists+linux-mips@lfdr.de>; Sat, 22 Feb 2020 11:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgBVKzX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 22 Feb 2020 05:55:23 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:43596 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726763AbgBVKzX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 22 Feb 2020 05:55:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
        In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=DlCbJQY5jkT3wCbdZlH9fm51B4vG4cDTRNzdb4paRpo=; b=V2nhRWDRw0cPvGvCor3iDABAh
        VCUKOhr5Np2ZaejYrcjODU6M98Olms7WtNuLnEhMcguEhW2sjOP6td+aq3qJSU8f14Fk4iekCGu2Q
        AHYDy8MbwY6ILCgXML5tvUNGTkIuVElb/ZIVQy4oPQl0GPbkZm+vguOCR0lPO2caGmCPU=;
Received: from p5dc58966.dip0.t-ipconnect.de ([93.197.137.102] helo=eeepc)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1j5SQy-0000FS-8R; Sat, 22 Feb 2020 11:54:57 +0100
Received: from localhost ([127.0.0.1])
        by localhost with esmtp (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1j5SQd-0006ef-7V; Sat, 22 Feb 2020 11:54:35 +0100
Date:   Sat, 22 Feb 2020 11:54:25 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andi Kleen <ak@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Subject: Re: [PATCH v5 2/6] Bindings: nvmem: add bindings for JZ4780 efuse
Message-ID: <20200222115425.50f66b08@kemnade.info>
In-Reply-To: <51642368a064073ab99bb3110863b5fadc382f82.1582367141.git.hns@goldelico.com>
References: <cover.1582367141.git.hns@goldelico.com>
        <51642368a064073ab99bb3110863b5fadc382f82.1582367141.git.hns@goldelico.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/TXXcjPEA1+Tp/2Jp=otKZJM"; protocol="application/pgp-signature"
X-Spam-Score: -1.0 (-)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

--Sig_/TXXcjPEA1+Tp/2Jp=otKZJM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 22 Feb 2020 11:25:37 +0100
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>=20
> This patch brings support for the JZ4780 efuse. Currently it only exposes
> a read only access to the entire 8K bits efuse memory.
>=20
> Tested-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> [converted to yaml]
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../bindings/nvmem/ingenic,jz4780-efuse.yaml  | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/ingenic,jz478=
0-efuse.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse=
.yaml b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
> new file mode 100644
> index 000000000000..09a8ef937750
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/ingenic,jz4780-efuse.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ingenic JZ EFUSE driver bindings
> +
> +maintainers:
> +  - PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> +
> +allOf:
> +  - $ref: "nvmem.yaml#"
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ingenic,jz4780-efuse
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    # Handle for the ahb for the efuse.
> +    maxItems: 1
> +
> +  clock-names:
> +   items:
> +     - const:  ahb2
> +
> +required:
> +  - compatible
> +  - reg
> +  - clock-names
- clocks ?

In my first try there was "clock" without s which
caused the trouble.

Regards,
Andreas

--Sig_/TXXcjPEA1+Tp/2Jp=otKZJM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl5RCGEACgkQl4jFM1s/
ye93xg//SCcxJHWMUcinq1MoSnVVJgBhkWBpGrRKieXw+b8f5sNlr1KA6tU9DnqU
fl52p7KO1iamSph/wsUihODT3ERk3SpmCcAwA/Ey6Yobvxb1xOgWU6l8fmaZm4rn
pMm8BCFvpggy8htUXaNG4A57TEKscPmAOx8hzwEUSD/qy/D0NXqj62iIdJQ4p3TA
4v7NydeqCSO2XGMb9XHg8xLUVGjl7ubjXmhNeOalftnawoaqFU5+hRK/ZSmhkFqX
35r0GqZ/1M2AvoVvV9kurWnvNue6merClUm0lPTp4e4gfeCcuyKu1doXRF1NA8SH
VZsPzypiam6YFlDR9Eyt3ancE9yVhuRlTbDSa3LcNoaxvJaZDS5o0gtfcnZcq2C7
50+6mLvTMfPUyXAh9IKM6D3jgRDaJpk1/JX9BqCL0x0PGrJMkhF421JkdoJFtdux
t5jJwjdU8DC208s2CZfQxNJgUceQD2Yo+b6MGSoHXyRuIzqakozB1z1gpNqgRPYD
XQXOCTYWs6ALZlCKQpiFE90B0FTU5TqsJ4H1hjkMrRhR5SffLlVlg7V7HgHqY2QC
OONAQoi5ArmCiHCCJpy8xFMHBOzhASCnGQILroeJU9uFF8Jyye3MUNo68d1CH+Fp
lQ8MWgfqO2knGr5baP9whsp5AAmbJDRNvxAt7kSiB3PaQCRtIvA=
=c88d
-----END PGP SIGNATURE-----

--Sig_/TXXcjPEA1+Tp/2Jp=otKZJM--
