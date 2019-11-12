Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B696F85AC
	for <lists+linux-mips@lfdr.de>; Tue, 12 Nov 2019 01:55:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbfKLAzq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Nov 2019 19:55:46 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37189 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726906AbfKLAzq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 11 Nov 2019 19:55:46 -0500
Received: by mail-oi1-f195.google.com with SMTP id y194so13281971oie.4;
        Mon, 11 Nov 2019 16:55:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=S1Rkl+7YzBL7zyaCWJBYcYMMFhNkSGP8H9icKQ+dNa8=;
        b=FfzluQdxz/qmBJz8mcVYsfOGfY11t2vYFVZzNXqRBBCu8qpHN0PYLk7ViIDuFkCk1y
         dCnqcypa4LXo7LyCnN46J+jsZW4yDrCPSrgFkEMJzAFuMWunOD9MnVsk7UgF8K4X8oMh
         GyIz4W5vPcs9Vw802589hhxiw0T2n0iYCjDN4HcBJLaF9DIwy+curm6+RvGAO7cdNvhf
         N8z9BUV/lA1B5B8Mf9ABtN369EDHAsQnTwqs1ChTCGquP4UCbFhLG7nabYqFzqDmGQo+
         8T54/XvAp31Fi0Kzjd42Bu/wbfdI45fNtDhennr9R5uKccRisfAzj12s4JHCq75MOwr1
         Mrug==
X-Gm-Message-State: APjAAAWK835qij3GSdVu9EAw6u/nGW9izmJaSfjrZv1iEkwX7VzyFxUB
        9h6YxCSaMkbAJDKlH6VvrQ==
X-Google-Smtp-Source: APXvYqwt7XIRcL/jlfvvYa/NNzx3/HJnxiWONynmSjKMMkTErHPnguu5aT+y+yjgDRvLGCRzhwmmOQ==
X-Received: by 2002:aca:3e8a:: with SMTP id l132mr1559897oia.146.1573520145339;
        Mon, 11 Nov 2019 16:55:45 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 63sm5620622oty.58.2019.11.11.16.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 16:55:44 -0800 (PST)
Date:   Mon, 11 Nov 2019 18:55:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, paul.burton@mips.com, sboyd@kernel.org,
        robh+dt@kernel.org, syq@debian.org, mark.rutland@arm.com,
        paul@crapouillou.net
Subject: Re: [PATCH 1/2 v3] dt-bindings: clock: Add X1000 bindings.
Message-ID: <20191112005544.GB7038@bogus>
References: <1571421006-12771-1-git-send-email-zhouyanjie@zoho.com>
 <1573378102-72380-1-git-send-email-zhouyanjie@zoho.com>
 <1573378102-72380-2-git-send-email-zhouyanjie@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573378102-72380-2-git-send-email-zhouyanjie@zoho.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 10 Nov 2019 17:28:21 +0800, Zhou Yanjie wrote:
> Add the clock bindings for the X1000 Soc from Ingenic.
> 
> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---
>  .../devicetree/bindings/clock/ingenic,cgu.txt      |  1 +
>  include/dt-bindings/clock/x1000-cgu.h              | 44 ++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 include/dt-bindings/clock/x1000-cgu.h
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
