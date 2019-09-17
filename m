Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D026FB5779
	for <lists+linux-mips@lfdr.de>; Tue, 17 Sep 2019 23:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbfIQV0e (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Sep 2019 17:26:34 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39708 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbfIQV0e (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Sep 2019 17:26:34 -0400
Received: by mail-ot1-f68.google.com with SMTP id s22so4437010otr.6;
        Tue, 17 Sep 2019 14:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=M6Vlf3B/Wu+Dqubj8csb+4sXrYeJJ15HwZ4X+qhYifM=;
        b=OXKEa0H3kPAc9sZAj6Q+R4oNuR7CD1XE+UW7lqp32ifgJBCub1fg0nzKUmTs/BDEug
         DaaXCMA78eP0S8CsQogbVVkLkornvdshaITa1si08SpAxDAZeNm0ME/kj4RVglSFC6nb
         OriFt7dyRNlI+yuPQir2Vx/qaFQ0DXXJXoBefQQK1Wzc7+WLmE65t+6uxwvecu3vlp8T
         I12yox1oqNx7yDxN8CVr8d0xODF6cCZWEHcoR40ahT/CM8cijJcg0YigGSfwvsmUYqls
         0AgbL1TFww2rylHLzjXppV1HYGSv7AAzuhIlZ/E1/xnLlWqf9LB1YQ4uV7JLb74sYl5v
         UVLQ==
X-Gm-Message-State: APjAAAUQXrGtgJhsl1KdjOJatBxk6YG9hGuJHRuCBKZptNbOWW/kDVSL
        TX53IF8SKpPNJXoD+IZrW9adGZt1DQ==
X-Google-Smtp-Source: APXvYqxGhnxWSKx8g6RLUigEhllxaFKP/MIFSifQer6Teu1Lkf4ivYiaPqmggq/rJzcRGj1PEAoXGw==
X-Received: by 2002:a9d:3be3:: with SMTP id k90mr820128otc.180.1568755592864;
        Tue, 17 Sep 2019 14:26:32 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 5sm1164594otp.20.2019.09.17.14.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 14:26:31 -0700 (PDT)
Date:   Tue, 17 Sep 2019 16:26:31 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, chenhc@lemote.com,
        paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net,
        maz@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.co, devicetree@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2 06/19] dt-bindings: interrupt-controller: Add
 Loongson-3 IOINTC
Message-ID: <20190917212631.GA3313@bogus>
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
 <20190905144316.12527-7-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190905144316.12527-7-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu,  5 Sep 2019 22:43:03 +0800, Jiaxun Yang wrote:
> Document Loongson-3 I/O Interrupt controller.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../loongson,ls3-iointc.yaml                  | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-iointc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
