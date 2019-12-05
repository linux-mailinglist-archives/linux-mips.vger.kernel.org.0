Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42D8E114830
	for <lists+linux-mips@lfdr.de>; Thu,  5 Dec 2019 21:38:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729776AbfLEUiT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Dec 2019 15:38:19 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44381 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729154AbfLEUiT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Dec 2019 15:38:19 -0500
Received: by mail-oi1-f193.google.com with SMTP id d62so4011015oia.11;
        Thu, 05 Dec 2019 12:38:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=74bslwr2DN1zCeo3ND+D4pQywMdZbBoCHyc8IyQISLI=;
        b=hE0mfFC8J9r2HuPp3Il6e8pQywLUNA/aBB1kC1QDk9mjWVGDoh0T+ftSic3o3CGPP+
         zGV6W4jo3VNLf6QSqXC+8BzAq3kohBqQM01aYBfk1Kiyqf8EkyigT1rotvVMVpKDQW8T
         1qqRHyNh0piVeaXx1/fg3dfZPLSZA/nljAvbymKQ2KLzo+FqZC3ESknPGQ4qNGyWyGhS
         KE4Gwzm7hPNBigMpTgRGGmkWL6dyQBDxO/0LLg6r6nG2A3vmr1P2gW35Ft3usoSdSWOL
         cFJ4WkOO588w7iT9btFGpXSGzBz0obIeEkMLDjSH2d4zoi56uLPyjF7Ko76oP/TCVaFo
         bkRg==
X-Gm-Message-State: APjAAAVhbAK2oqyA497y2wyYz9Tl+fGXGERgG1WpPfpDHySe48YXyHDF
        ZCpT5FgW//28lczsO++piA==
X-Google-Smtp-Source: APXvYqw6k/qoeDxNK4Ffi3fcSBgKVBXoNd3CIqjOnqbICiI6Mu4iE4xT6+8vPcZIWZ6oOHNHTV4KVg==
X-Received: by 2002:aca:c354:: with SMTP id t81mr9425585oif.149.1575578298263;
        Thu, 05 Dec 2019 12:38:18 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b3sm3907834oie.25.2019.12.05.12.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 12:38:17 -0800 (PST)
Date:   Thu, 5 Dec 2019 14:38:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        syq@debian.org, paul@crapouillou.net, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: Re: [PATCH 2/5] dt-bindings: clock: Add X1830 bindings.
Message-ID: <20191205203817.GA3571@bogus>
References: <1574825576-91028-1-git-send-email-zhouyanjie@zoho.com>
 <1574825576-91028-3-git-send-email-zhouyanjie@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574825576-91028-3-git-send-email-zhouyanjie@zoho.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 27 Nov 2019 11:32:53 +0800, Zhou Yanjie wrote:
> Add the clock bindings for the X1830 Soc from Ingenic.
> 
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---
>  .../devicetree/bindings/clock/ingenic,cgu.txt      |  1 +
>  include/dt-bindings/clock/x1830-cgu.h              | 46 ++++++++++++++++++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 include/dt-bindings/clock/x1830-cgu.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
