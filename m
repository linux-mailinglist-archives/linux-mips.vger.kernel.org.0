Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A30FE9E1
	for <lists+linux-mips@lfdr.de>; Mon, 29 Apr 2019 20:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729070AbfD2SOq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Apr 2019 14:14:46 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35340 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728926AbfD2SOq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Apr 2019 14:14:46 -0400
Received: by mail-ot1-f68.google.com with SMTP id g24so4909630otq.2;
        Mon, 29 Apr 2019 11:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=R5uLoWTWxmc3LzH+4BKxQ5i6D3mnCa8AsftYWq2DnN0=;
        b=QjV1eQWrh/Jcg/cYN/bx70IbXD0Q+VLeCWJCDb5epJQUgAE0rWsPM9TGmZC8KMnWQ0
         7n47Li5IwYzog8R6m/U6yNS87sWBUxzDhbip7UOQdqqlUHxfyEpGTSGppkBfrmvZ0Ai1
         drf9RA9oedbKv0XsTnZMyBAie6FhiD3DRmKdM7ytpzVP+ukZjlHrJBCKFGCAzNypWk/0
         9dK0xsUX1XimDQZtPhf58riB1Ke3D01kqqZglUWetQ07SJ758yS69DwHKhyCimP7s5Qk
         vtcqUjpPWfDbBSw4dBidXzx47ocu16WXY1VB4KWYDICHrXnMDNaUhgGsBEry3TfXCWcz
         Cr7A==
X-Gm-Message-State: APjAAAXA4dlnJnjLsR6snURAhB2SOkhN9udLFvLdOiGpYKzkntHAdYw1
        Di+Mk4xzPIHLJnls1gvP5Q==
X-Google-Smtp-Source: APXvYqz7+YB4v1H1y1UlLgtiwNoAqn3FjfmIv/CuDJhLYF+fIHnYTRmfGTZ3Yq9ZlRw4Tskm3Q38Vw==
X-Received: by 2002:a9d:6355:: with SMTP id y21mr651764otk.354.1556561685399;
        Mon, 29 Apr 2019 11:14:45 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 2sm13677528ots.22.2019.04.29.11.14.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 11:14:44 -0700 (PDT)
Date:   Mon, 29 Apr 2019 13:14:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        paul.burton@mips.com, robh+dt@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2 5/6] dt/bindings: Add bindings for ls1x CPU
Message-ID: <20190429181444.GA9504@bogus>
References: <20190312091520.8863-2-jiaxun.yang@flygoat.com>
 <20190411121915.8040-1-jiaxun.yang@flygoat.com>
 <20190411121915.8040-6-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190411121915.8040-6-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 11 Apr 2019 20:19:14 +0800, Jiaxun Yang wrote:
> This documented ls1x CPU node.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  Documentation/devicetree/bindings/mips/loongson/ls1x-cpu.txt | 4 ++++
>  1 file changed, 4 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/loongson/ls1x-cpu.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
