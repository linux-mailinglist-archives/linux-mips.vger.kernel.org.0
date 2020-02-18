Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D21F1632F6
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2020 21:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgBRUWE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 18 Feb 2020 15:22:04 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:45847 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbgBRUWD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 18 Feb 2020 15:22:03 -0500
Received: by mail-ot1-f68.google.com with SMTP id 59so20838397otp.12;
        Tue, 18 Feb 2020 12:22:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=6bhlYFbTU31k44CeyF0cp+l2NnzkZFlb1NdHHQJJpQc=;
        b=rbv4vK6QcuQ+O/YjvO01DZXJriMXnl6DI8PeRysvXqZjS6FsJk+zbB3CgqKS+lJCsa
         GnldoiGTjt3MwAxLBRL+EHCVA45NMecYqfpBQGaTQd3Rcd0nLQxbiCayiCe1I4qKQIfr
         b7XpPCgS8PSMRut01TRSvsB34Ycyd6lXuKJv3GS4tCPWKnFrB2zIYUKNhjeL4z5k5Ngy
         zKnaDNLGD0O6rF0RiQ4SuN816qz1h49eAWhbZyubjdplbzfuw8sNqPbDuMZVaexKZi3k
         p9YK/xD1pL0/JZom2QY78yCrM91l/svwhSCQEXihrpU9kGeGYM/7RsdGIBdfSqdgc/oW
         uQ3A==
X-Gm-Message-State: APjAAAW1/MEN3WJpBmfIWGVSRlTGrBgX0bZs+m8swSds53p9L1OTz+Cx
        WYBycnGJWZOvv9FlqTSo2w==
X-Google-Smtp-Source: APXvYqxT+CIgJyZ9ZV3zhU/dPm0cNLpPF5jFMryAjazLFUuf50hbJ2n2d8O+6N3EFn9+aeh2f/Dydw==
X-Received: by 2002:a9d:63d6:: with SMTP id e22mr17382781otl.185.1582057322748;
        Tue, 18 Feb 2020 12:22:02 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 108sm1719452oti.1.2020.02.18.12.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 12:22:02 -0800 (PST)
Received: (nullmailer pid 2334 invoked by uid 1000);
        Tue, 18 Feb 2020 20:22:00 -0000
Date:   Tue, 18 Feb 2020 14:22:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        paul@crapouillou.net, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org,
        paulburton@kernel.org, jiaxun.yang@flygoat.com, chenhc@lemote.com,
        allison@lohutok.net, tglx@linutronix.de, daniel.lezcano@linaro.org,
        geert+renesas@glider.be, krzk@kernel.org, keescook@chromium.org,
        ebiederm@xmission.com, miquel.raynal@bootlin.com,
        paul@boddie.org.uk, hns@goldelico.com,
        mips-creator-ci20-dev@googlegroups.com
Subject: Re: [PATCH v5 5/7] dt-bindings: MIPS: Document Ingenic SoCs binding.
Message-ID: <20200218202200.GA1533@bogus>
References: <1581792932-108032-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1581792932-108032-7-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1581792932-108032-7-git-send-email-zhouyanjie@wanyeetech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 16 Feb 2020 02:55:30 +0800, =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= wrote:
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
>     v3->v4:
>     Fix bugs in the two yaml files.
>     
>     v4->v5:
>     No change.
> 
>  .../bindings/mips/ingenic/ingenic,cpu.yaml         | 53 ++++++++++++++++++++++
>  .../bindings/mips/ingenic/ingenic,soc.yaml         | 35 ++++++++++++++
>  2 files changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,soc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
Error: Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.example.dts:26.26-27 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:300: recipe for target 'Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.example.dt.yaml] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1238592
Please check and re-submit.
