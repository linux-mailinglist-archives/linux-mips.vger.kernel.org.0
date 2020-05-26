Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5586D1E2D93
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 21:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391841AbgEZTWB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 15:22:01 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:38202 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391941AbgEZTKp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 15:10:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1590520241; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p9jm//+Z7Q5hm03MZeLwX34SXNnp8zZEFN+1T4rYbdM=;
        b=PxJFdkDes4KukZbPwS5mMveTS9QphjYgDvbxZ7NKMoj6+38ulMiSySkxN1YXLQc7ZPi0Sn
        +UpgL7qaS37Izf1cqqD7PdTi4j2eAdyiAkWC1ByRQ8BMkKUKru3O0BetJgCPNmO46Xq5et
        cW+Zc/BXGPka2lWC4YReEAiLuQxRZSk=
Date:   Tue, 26 May 2020 21:10:29 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/1] dt-bindings: MIPS: Document Ingenic SoCs binding.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, hns@goldelico.com, paul@boddie.org.uk,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Message-Id: <H9DYAQ.4YAB8VVZPLZO@crapouillou.net>
In-Reply-To: <20200526170722.17206-2-zhouyanjie@wanyeetech.com>
References: <20200526170722.17206-1-zhouyanjie@wanyeetech.com>
        <20200526170722.17206-2-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le mer. 27 mai 2020 =C3=A0 1:07, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> Document the available properties for the SoC root node and the
> CPU nodes of the devicetree for the Ingenic XBurst SoCs.
>=20
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
> Tested-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>
> ---
>  .../bindings/mips/ingenic/ingenic,cpu.yaml         | 57=20
> ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644=20
> Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
>=20
> diff --git=20
> a/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml=20
> b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
> new file mode 100644
> index 000000000000..afb02071a756
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mips/ingenic/ingenic,cpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bindings for Ingenic XBurst family CPUs
> +
> +maintainers:
> +  - =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wanyeetech.com=
>
> +
> +description:
> +  Ingenic XBurst family CPUs shall have the following properties.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +
> +      - description: Ingenic XBurst=C2=AE1 CPU Cores
> +        items:

Strip the 'items', put the enum directly.

> +          enum:
> +            - ingenic,xburst-mxu1.0
> +            - ingenic,xburst-fpu1.0-mxu1.1
> +            - ingenic,xburst-fpu2.0-mxu2.0
> +
> +      - description: Ingenic XBurst=C2=AE2 CPU Cores
> +        items:

Same here.

> +          enum:
> +            - ingenic,xburst2-fpu2.1-mxu2.1-smt
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - device_type
> +  - compatible
> +  - reg

device_type is not in the list of your properties.

Also, I think you need a clock in there.

-Paul

> +
> +examples:
> +  - |
> +    cpus {
> +    	#address-cells =3D <1>;
> +    	#size-cells =3D <0>;
> +
> +    	cpu0: cpu@0 {
> +    		device_type =3D "cpu";
> +    		compatible =3D "ingenic,xburst-fpu1.0-mxu1.1";
> +    		reg =3D <0>;
> +    	};
> +
> +    	cpu1: cpu@1 {
> +    		device_type =3D "cpu";
> +    		compatible =3D "ingenic,xburst-fpu1.0-mxu1.1";
> +    		reg =3D <1>;
> +    	};
> +    };
> +...
> --
> 2.11.0
>=20


