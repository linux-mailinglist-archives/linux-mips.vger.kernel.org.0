Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25283ECBE2
	for <lists+linux-mips@lfdr.de>; Sat,  2 Nov 2019 00:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbfKAX1t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Nov 2019 19:27:49 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37771 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfKAX1t (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 Nov 2019 19:27:49 -0400
Received: by mail-pg1-f194.google.com with SMTP id z24so2836123pgu.4;
        Fri, 01 Nov 2019 16:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:subject:references
         :in-reply-to;
        bh=OGX+5EXotCNjkHpvjKvnsrcFkc2VJs2tPYDyO5L+3zA=;
        b=AZtYKlk0vLuYfBfKAC0YOTzGE30IWQlscsfInbMEyFZbyj58S3zRIEORzjoWKLiRlo
         37ePF3WFzVG3ahE8axvoBrKr6julOC+Fdg5a8rkihovkVmlgwcARnSapGh3FaFkghWKB
         oX0nSctSwHwaPOMkx+iF1F3R9kEzU3AIrIF8r8eHVLuUAiWePeV2iATQ7bgYRWkugq7/
         zk98Pfkkcj9DE2QTL0+jC9igxMfWFkuqGElWm1XUUIQXMgPN3sMBD6PlXTUhYxqGyGgV
         S2kN9CIlTV0fnWYoY6+/qHAqf0CQOOBd7Qw3kGJoIp6AEVA/W8I/8GEmkBdBGcXbNZqt
         TQEQ==
X-Gm-Message-State: APjAAAV4CBNdno1pA7nxH1SM/YLVvV5M6EcPXYhrnIzWFJQpic+S7CgA
        Xb+2K781U4li2jnJMLI5Ukk=
X-Google-Smtp-Source: APXvYqwXQVJlqSQsFNDLaXi3BP9A+rmTBzx4l+FZChqM6vjiqGiac54tjEEitvM+j5rIee5oVbomWg==
X-Received: by 2002:a62:68c1:: with SMTP id d184mr6716578pfc.195.1572650868256;
        Fri, 01 Nov 2019 16:27:48 -0700 (PDT)
Received: from localhost ([2601:646:8a00:9810:9d6:9cca:ff8c:efe0])
        by smtp.gmail.com with ESMTPSA id s24sm8036408pfm.144.2019.11.01.16.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 16:27:47 -0700 (PDT)
Message-ID: <5dbcbf73.1c69fb81.11300.7c39@mx.google.com>
Date:   Fri, 01 Nov 2019 16:27:46 -0700
From:   Paul Burton <paulburton@kernel.org>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 1/2] MIPS: PCI: make phys_to_dma/dma_to_phys for  pci-xtalk-bridge common
References:  <20191024101829.12543-1-tbogendoerfer@suse.de>
In-Reply-To:  <20191024101829.12543-1-tbogendoerfer@suse.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Thomas Bogendoerfer wrote:
> All platforms using pci-xtalk-bridge can share common phys_to_dma/
> dma_to_phys function. So we move it form ip27 specific file to
> pci-xtalk-bridge.c

Series applied to mips-next.

> MIPS: PCI: make phys_to_dma/dma_to_phys for pci-xtalk-bridge common
>   commit b9e9defb5e60
>   https://git.kernel.org/mips/c/b9e9defb5e60
>   
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: add support for SGI Octane (IP30)
>   commit 7505576d1c1a
>   https://git.kernel.org/mips/c/7505576d1c1a
>   
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
