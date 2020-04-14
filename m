Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 359331A86FA
	for <lists+linux-mips@lfdr.de>; Tue, 14 Apr 2020 19:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407512AbgDNRHC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Apr 2020 13:07:02 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36136 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729042AbgDNRG6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Apr 2020 13:06:58 -0400
Received: by mail-ot1-f68.google.com with SMTP id b13so382256oti.3;
        Tue, 14 Apr 2020 10:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=R7DvIE6xgB6bsjZY6OStsQ7vzWt/6mNtD60f488gFE0=;
        b=gXCvYbn55D8xVCMLHfglEXzITOQetzVSAfCKD6TNpADR6FIj/VJLzIU9fjQ6GFaAxY
         KILG10G3JyDlMeVK+kOyqeQwEw3Q1mHp68LB57NKB6oU4RGr5oqITp08WbwAP5Irnllh
         rMghpCz1mERczcI9aktDsSWltM8p8Vmsh1AwpH8dL4RHKMkrQlEm7isVPrIQ/S6VjilL
         YGXjVdsHzhHMO4fc804MI2nReGnwbREGLNH/yR5vOjA0xAcpBxTlJYFTMyU/LuzOUc8y
         s1huHnfXxzyqCGtvpcVAqDhKWZkxIGFjy3Ayt0YZVJ1NJN9/xFdoWOy7Q2E2BkrZMOAr
         6hyw==
X-Gm-Message-State: AGi0PuYlyWPXq8uwJ7da4eChH5R8NEdUE9h+QZDAH/Wp2R35zM1K0Ve2
        wNL7ei10ECL0Sh3yLSjQZvWT45Q=
X-Google-Smtp-Source: APiQypLcWMJCxCvJhaBdIMDkx5zzMNBBqtXItGq/cEfJVplp7CnhWshFW1uiWYkqaLhu0iOA7MF6aw==
X-Received: by 2002:a4a:92cd:: with SMTP id j13mr19440736ooh.96.1586884017955;
        Tue, 14 Apr 2020 10:06:57 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y8sm3450729otg.6.2020.04.14.10.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 10:06:57 -0700 (PDT)
Received: (nullmailer pid 11468 invoked by uid 1000);
        Tue, 14 Apr 2020 17:06:56 -0000
Date:   Tue, 14 Apr 2020 12:06:56 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: Document Loongson RS780E PCH ACPI
 Controller
Message-ID: <20200414170656.GA11412@bogus>
References: <20200402104851.368465-1-jiaxun.yang@flygoat.com>
 <20200402104851.368465-3-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402104851.368465-3-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu,  2 Apr 2020 18:48:41 +0800, Jiaxun Yang wrote:
> 
> This controller is attached under ISA Bus and can be found
> in Loongson-3 systems with RS780E PCH.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../bindings/mips/loongson/rs780e-acpi.yaml   | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/loongson/rs780e-acpi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
