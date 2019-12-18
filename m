Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53A99124A6D
	for <lists+linux-mips@lfdr.de>; Wed, 18 Dec 2019 15:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727313AbfLROzP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 18 Dec 2019 09:55:15 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37396 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbfLROzP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 18 Dec 2019 09:55:15 -0500
Received: by mail-ot1-f65.google.com with SMTP id k14so2819279otn.4;
        Wed, 18 Dec 2019 06:55:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=UZaMSipfOS8p2xxnsUP8G9QetOP6spFrcqBy10Sn310=;
        b=p5bltue4U9UT4STVw/OdT4GY6MCbN4YX5zuIJYzmDauLp/fVuBl0GSI96bFB3Wi1yi
         qOOS1tXNAG5K/AJM/wqQjQtlYSnGS43IZh1t/P5G4D8MmelMGKu6fynjvq/9jcCw8DMf
         KGUCA0FhLox3OUE2Ok90Bi3PBg/ThWtK3JZFf1y6upMKzsFR8mgNhKNaJxUYuZUzvrol
         feMAh0hWnSSBczviXuyRaAB0Y9E0/MytKZaH0vdv0tIf/o7O+AMnppckjDY3lPCdsy4O
         b5VdAfXAqpl1RDTXRWwNpY/ZJeIDaJZiI3bdltEZD4qSiaAx7Y7o09LLq7mwYV5yblVX
         53zA==
X-Gm-Message-State: APjAAAVOOiZWIUY7S2Ebb20hmLWCtDtXh1dWAz5ew/rI9oslXBvJ0wR9
        GMcLXl9lwFh7kXybCmo+rw==
X-Google-Smtp-Source: APXvYqwu878UtVJu5MM+hlktxMA9MsbfECa0BDggwXlBafc5Pa+W9zRVbUhWbFNvitgQEcfV/gZP7Q==
X-Received: by 2002:a9d:7592:: with SMTP id s18mr3197591otk.130.1576680914382;
        Wed, 18 Dec 2019 06:55:14 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x19sm769754otk.42.2019.12.18.06.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 06:55:13 -0800 (PST)
Date:   Wed, 18 Dec 2019 08:55:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, jhogan@kernel.org,
        mripard@kernel.org, shawnguo@kernel.org, mark.rutland@arm.com,
        alexandre.belloni@bootlin.com, ralf@linux-mips.org,
        heiko@sntech.de, icenowy@aosc.io, ak@linux.intel.com,
        laurent.pinchart@ideasonboard.com, krzk@kernel.org,
        geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, keescook@chromium.org,
        ebiederm@xmission.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 772753199@qq.com
Subject: Re: [PATCH v8 3/4] dt-bindings: MIPS: Add Ingenic XBurst based
 boards.
Message-ID: <20191218145513.GA12219@bogus>
References: <1575979363-25956-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1575979363-25956-4-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1575979363-25956-4-git-send-email-zhouyanjie@wanyeetech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 10 Dec 2019 20:02:42 +0800, =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?=          wrote:
> Add Ingenic XBurst based boards, prepare for later dts.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
> 
> Notes:
>     v1->v2:
>     No change.
>     
>     v2->v3:
>     No change.
>     
>     v3->v4:
>     Adjust the description to make it more reasonable.
>     
>     v4->v5:
>     Adjust item naming to prevent conflicts with
>     subsequent "CU Geo" boards.
>     
>     v5->v6:
>     No change.
>     
>     v6->v7:
>     Change my Signed-off-by from "Zhou Yanjie <zhouyanjie@zoho.com>"
>     to "周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>" because
>     the old mailbox is in an unstable state.
>     
>     v7->v8:
>     No change.
> 
>  .../devicetree/bindings/mips/ingenic/devices.yaml  | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/ingenic/devices.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
