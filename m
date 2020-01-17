Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27F05140EFB
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jan 2020 17:32:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgAQQb7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Jan 2020 11:31:59 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42165 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbgAQQb7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Jan 2020 11:31:59 -0500
Received: by mail-oi1-f194.google.com with SMTP id 18so22695123oin.9;
        Fri, 17 Jan 2020 08:31:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=5gj1/chJ9sV8kpdyataWFH+xbqAvecJvMET5S/FO4BY=;
        b=KrQHPGEKwzzDNTU84uZNuV3KRKyhW7T0CMRw3iN7rG1VTQ5qmiAZnMkNLfgcFJz56T
         8ZwIol13oaHidE4d9eeB9Dh3mzYvkZ06w4oeitVQjKwdPDA3raalGz6wJpV8NoTcN2aF
         toVNlNjnKJCb/gP0MEmyUgRfr+dNAtlY+AkNGKD7X9nt53iVKTbJxmwgLaHmDhuPqfgw
         soS91F9P5nba+fb/WYKMzR69T47peb5VtxsC/t4OiNS9nRWJ2TCdFdvC7AO2uWjUQTkJ
         q12kP1EgQRB1uPsEA4/C6yWdvHjOQ4PuJN4WnB+GBdBDg4VTtfRwrzxxQTrc6ZxvtsfQ
         VZfw==
X-Gm-Message-State: APjAAAVhaFjZ3FMr3mU8ZWQSqb8Cnzek4rqy0OW5UVIvcs4byKmVAoea
        98UOpJilbTJ+PpsNaz1NFw==
X-Google-Smtp-Source: APXvYqxs5kEVxVAuMPNxBDE0jWIqvD8uzgfpnztY5yy6y+7ElSVcbkmwv+bYZcJhO8bAItMve31emQ==
X-Received: by 2002:aca:fcd1:: with SMTP id a200mr3911032oii.74.1579278718422;
        Fri, 17 Jan 2020 08:31:58 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a24sm7933178oic.10.2020.01.17.08.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 08:31:57 -0800 (PST)
Received: (nullmailer pid 25438 invoked by uid 1000);
        Fri, 17 Jan 2020 16:31:56 -0000
Date:   Fri, 17 Jan 2020 10:31:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mips-creator-ci20-dev@googlegroups.com,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, mark.rutland@arm.com, syq@debian.org,
        ralf@linux-mips.org, rick.tyliu@ingenic.com, jason@lakedaemon.net,
        keescook@chromium.org, geert+renesas@glider.be, krzk@kernel.org,
        paul@crapouillou.net, prasannatsmkumar@gmail.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        ebiederm@xmission.com, hns@goldelico.com, paul@boddie.org.uk
Subject: Re: [PATCH v2 3/6] dt-bindings: MIPS: Document Ingenic SoCs binding.
Message-ID: <20200117163156.GA24497@bogus>
References: <1579195429-59828-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1579195429-59828-5-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1579195429-59828-5-git-send-email-zhouyanjie@wanyeetech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 17 Jan 2020 01:23:46 +0800, =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= wrote:
> Document the available properties for the SoC root node and the
> CPU nodes of the devicetree for the Ingenic XBurst SoCs.
> 
> Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
> 
> Notes:
>     v1->v2:
>     Change the two Document from txt to yaml.
> 
>  .../bindings/mips/ingenic/ingenic,cpu.yaml         | 53 ++++++++++++++++++++++
>  .../bindings/mips/ingenic/ingenic,soc,yaml         | 35 ++++++++++++++
>  2 files changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,soc,yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.yaml:  while parsing a block collection
  in "<unicode string>", line 17, column 7
did not find expected '-' indicator
  in "<unicode string>", line 17, column 25
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.example.dts] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1224371
Please check and re-submit.
