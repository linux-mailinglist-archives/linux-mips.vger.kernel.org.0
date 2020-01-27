Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 313C014A5FB
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jan 2020 15:26:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbgA0O0Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Jan 2020 09:26:24 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41721 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgA0O0Y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Jan 2020 09:26:24 -0500
Received: by mail-ot1-f66.google.com with SMTP id r27so8481740otc.8;
        Mon, 27 Jan 2020 06:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Nxt//FHypijseal0ghIbraBsi2lnDnz+2r9nMCuOYJI=;
        b=eZAPI5FnyZz44CPp9IGSQEvBWwCn4DXi/Guo5baZ6bhVjt3fMCNXuA0yI4ATjE3iOF
         3JHzBL1/mRiXV167pLJR7kcRza4t3Kga6EOUX7lygX3pqtpzmcVDUXpTyRyPij/U6wgl
         nofLvaxUBmmpHNLerroiPVg+6gka9k/87YklZ1HJ35zSZL3zf84mSwCJzeu9Z4Cd25oD
         fRFfj/JsO9CGTL59ZlYE1noNwg+/8OfSokTfah+Nez4wV0sk9p/swDNIaZuzuL1yUGlz
         9gJ5MVy5EvrZe9QcoQqFDzEFmJJOgoh7MXQuBfcNv/bfX/t1IvMDzvReTkVlkvipE4z+
         CPDA==
X-Gm-Message-State: APjAAAVQf7mrKRbOgOROMG32VePv32vgJ7BmvnFlv7Re/q4oPR+kS0Gm
        YRJF2wsT0n9gmPUsYY+MdQ==
X-Google-Smtp-Source: APXvYqyBPH3RWTQHiqmN/lkBJBZUFhrE+9jZVDWpGBXqHJYibAu4HcUdQ/ttp2aqxhjJ+ejTuvj9gg==
X-Received: by 2002:a9d:2028:: with SMTP id n37mr13077692ota.127.1580135183616;
        Mon, 27 Jan 2020 06:26:23 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t7sm2606437oth.79.2020.01.27.06.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 06:26:22 -0800 (PST)
Received: (nullmailer pid 29798 invoked by uid 1000);
        Mon, 27 Jan 2020 14:26:20 -0000
Date:   Mon, 27 Jan 2020 08:26:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, jhogan@kernel.org,
        tglx@linutronix.de, daniel.lezcano@linaro.org, shawnguo@kernel.org,
        mark.rutland@arm.com, syq@debian.org, ralf@linux-mips.org,
        miquel.raynal@bootlin.com, keescook@chromium.org,
        ebiederm@xmission.com, krzk@kernel.org, geert+renesas@glider.be,
        paul@crapouillou.net, prasannatsmkumar@gmail.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        mturquette@baylibre.com, sboyd@kernel.org, chenhc@lemote.com,
        jiaxun.yang@flygoat.com, paul@boddie.org.uk, hns@goldelico.com,
        mips-creator-ci20-dev@googlegroups.com, rick.tyliu@ingenic.com
Subject: Re: [PATCH v3 3/6] dt-bindings: MIPS: Document Ingenic SoCs binding.
Message-ID: <20200127142620.GA29108@bogus>
References: <1579867508-81499-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1579867508-81499-5-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1579867508-81499-5-git-send-email-zhouyanjie@wanyeetech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 24 Jan 2020 20:05:05 +0800, =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= wrote:
> Document the available properties for the SoC root node and the
> CPU nodes of the devicetree for the Ingenic XBurst SoCs.
> 
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
> Tested-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
> 
> Notes:
>     v1->v2:
>     Change the two Document from txt to yaml.
>     
>     v2->v3:
>     Fix formatting errors.
> 
>  .../bindings/mips/ingenic/ingenic,cpu.yaml         | 53 ++++++++++++++++++++++
>  .../bindings/mips/ingenic/ingenic,soc,yaml         | 35 ++++++++++++++
>  2 files changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,soc,yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

warning: no schema found in file: Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml: ignoring, error in schema: properties: compatible: oneOf: 0
Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml: properties:compatible:oneOf:0: 'ingenic,xburst' is not of type 'object', 'boolean'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml: properties:compatible:oneOf:1: 'ingenic,xburst2' is not of type 'object', 'boolean'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml: Additional properties are not allowed ('Example' was unexpected)
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml: Additional properties are not allowed ('Example' was unexpected)
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.example.dts] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1228796
Please check and re-submit.
