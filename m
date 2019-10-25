Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B717DE5621
	for <lists+linux-mips@lfdr.de>; Fri, 25 Oct 2019 23:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbfJYVtG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Oct 2019 17:49:06 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38913 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfJYVtF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 25 Oct 2019 17:49:05 -0400
Received: by mail-oi1-f196.google.com with SMTP id v138so2577503oif.6;
        Fri, 25 Oct 2019 14:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wGm3OSExE/97BmM29xjH36/abWZ9nPYDMo8RkVIn7DU=;
        b=ISKp1hthhRab8G1/BzjmgcJCtX2BtVilxMqR/GAIdLmwh8PuNwXtbk5XC5KwSZWhO6
         a0pU3jvTPSFQCBKO8Fsz+R8oqem9R4JsvriLiO1abdJ9xO7pl5/2te7H6vEmiQ5dV4iU
         32/eu0DWGnl7JMvtUD4JnE5ZsUAcGOvGSDqI5uw+eqWedniSEMgIpEHZUzvljwuYaxL8
         U4f21bXknCiJr0aocYIxj8x+sbU9TYqXfCo+9O11Yi56tBIJSRgFo/1T5EwXeSFqScps
         cwoPB44//bZ7u5+/4I9FBfMUBbbAlkRx4aursLyRMfUfWlZwy0xKFhGbcJns6Ovs5Pr0
         dTZQ==
X-Gm-Message-State: APjAAAVKPO7Yy1y6MrZ7iSO9mjF1GE0nIY3vcJxgUgfHiufiM8mxh6ys
        yAl6l3/SQb6roQikEQDjmA==
X-Google-Smtp-Source: APXvYqwLbnmVyTEOV9qgJJFVyWAeKISdHnloLOn/3BypbMbjV29PEr1S6ftViDUyEbH+5o61CqsHSw==
X-Received: by 2002:a05:6808:7d9:: with SMTP id f25mr4933670oij.69.1572040144629;
        Fri, 25 Oct 2019 14:49:04 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 34sm1139469otf.55.2019.10.25.14.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 14:49:03 -0700 (PDT)
Date:   Fri, 25 Oct 2019 16:49:03 -0500
From:   Rob Herring <robh@kernel.org>
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, mturquette@baylibre.com,
        sboyd@kernel.org, mark.rutland@arm.com, paul@crapouillou.net
Subject: Re: [PATCH 1/2 v2] dt-bindings: clock: Add X1000 bindings.
Message-ID: <20191025214903.GA14052@bogus>
References: <1571421006-12771-1-git-send-email-zhouyanjie@zoho.com>
 <1571763389-43443-1-git-send-email-zhouyanjie@zoho.com>
 <1571763389-43443-2-git-send-email-zhouyanjie@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571763389-43443-2-git-send-email-zhouyanjie@zoho.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 23 Oct 2019 00:56:28 +0800, Zhou Yanjie wrote:
> Add the clock bindings for the X1000 Soc from Ingenic.
> 
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---
>  .../devicetree/bindings/clock/ingenic,cgu.txt      |  1 +
>  include/dt-bindings/clock/x1000-cgu.h              | 41 ++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 include/dt-bindings/clock/x1000-cgu.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
