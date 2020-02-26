Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2EC017026A
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2020 16:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728117AbgBZP33 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Feb 2020 10:29:29 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35278 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728079AbgBZP32 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 Feb 2020 10:29:28 -0500
Received: by mail-ot1-f68.google.com with SMTP id r16so3331696otd.2;
        Wed, 26 Feb 2020 07:29:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=CKZHnTZFLjHnIhTgl+KQX73Geyb445C6jtf3nPozbN8=;
        b=CbmmjqQjYodMSKYdCcZDPuLCSLae3MkHJkbc7K8sRjV3NS/CgAn8wMqyoO9ith/hgd
         pLy+a8t4g3WzsXifS8xSGfhqSmeAJAFhNzTpOZOlHf7m6vrq/Jl+0fBjIc/tH786e62d
         NK7vru36rcFJ7JntmgEWZRURaYe/24ITu9bgeuLZYkHUAmpPy8jbIraon3Ii50H+aBM3
         5fBbkGN+sbAZVuetNzsskrymnwfabS55hYXYFFjgIgPxxDvF3HHe0G3WY71X9WALnLov
         7v3eQDhgqDgFE0y1ggcY2ooMkQTs7wT+FLknjm6izPPZ9QdEngCBm7I9/tqGWSoqcq3r
         JgSw==
X-Gm-Message-State: APjAAAVQXY2l3AyzfeFKcEAwgcGIIJgOKSxU33hBdaQqhnWFtH8A4u6A
        EXQ23qfMPe+aVdz83T2gPQ==
X-Google-Smtp-Source: APXvYqx+qhtLvwQMXMsFR3sSm5SeSUm6KcfIscmPoWF1kkyL4IQ6y2JoUxjOr/JnzI8etl5XqNBztQ==
X-Received: by 2002:a9d:6d1a:: with SMTP id o26mr3404602otp.141.1582730960570;
        Wed, 26 Feb 2020 07:29:20 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s83sm885228oif.33.2020.02.26.07.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 07:29:19 -0800 (PST)
Received: (nullmailer pid 5239 invoked by uid 1000);
        Wed, 26 Feb 2020 15:29:18 -0000
Date:   Wed, 26 Feb 2020 09:29:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        tglx@linutronix.de, maz@kernel.org, jason@lakedaemon.net,
        sboyd@kernel.org, mturquette@baylibre.com, mark.rutland@arm.com,
        robh+dt@kernel.org, daniel.lezcano@linaro.org,
        paul@crapouillou.net, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, dongsheng.qiu@ingenic.com
Subject: Re: [PATCH 1/4] dt-bindings: timer: Add X1000 bindings.
Message-ID: <20200226152918.GA5207@bogus>
References: <1582100974-129559-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1582100974-129559-3-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1582100974-129559-3-git-send-email-zhouyanjie@wanyeetech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 19 Feb 2020 16:29:31 +0800, =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= wrote:
> Add the timer bindings for the X1000 Soc from Ingenic.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
>  Documentation/devicetree/bindings/timer/ingenic,tcu.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
