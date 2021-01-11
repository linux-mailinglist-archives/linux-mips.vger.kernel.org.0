Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 435492F225F
	for <lists+linux-mips@lfdr.de>; Mon, 11 Jan 2021 23:02:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730511AbhAKWB5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Jan 2021 17:01:57 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:38145 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731436AbhAKWB4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 11 Jan 2021 17:01:56 -0500
Received: by mail-oi1-f181.google.com with SMTP id x13so218283oic.5;
        Mon, 11 Jan 2021 14:01:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=swMeYjn7bXqKRG/eRayNFSOvBd+XVAGrQ+8GLln8aFU=;
        b=CrcNrAVOwNysbiR4O01UCx3ro0JdS7IsL/o5jw8+y8OuMx5BQJgz+wOtqlGfkn2hz1
         AI3rtEi2d+0ITp+XLg7qeYGmf2Mf/cBbNNRXSFLPKhYRYE700PTKDcfD7RM6VOLskycy
         d32BIQ3y+fVRhrk5oFKXFQRjOH+9hD1MPGCnx/cM6ILKvM+WV4W94TCJU/MhZI9N4CZb
         XWLV/9p0PWI0zsUuSSfOjfc4E9wVUN2YCLqAnPRZMbsxq0yP/luzcOroOS6DhKtVrFUS
         Omp21aEN7J+EG3l1gHwLjsw9AW6h9xBCL5aEqdqKBDiMFuNhbzF8JM6Y+BArJotV83Y8
         Px2w==
X-Gm-Message-State: AOAM530OD+9dqv1cGOK6cPFUExOvzg4MNcVeqBkQeNb59n++dEa6JuIj
        6Lh+zuVonXFQmPTvV7gq3A==
X-Google-Smtp-Source: ABdhPJxFniA6qPNv3KBmaOx3/o/zHYRUuc8SweMVySqIHH9M/ZOASz+ccNp9qYW5Gxcyevxidi6b+g==
X-Received: by 2002:aca:fc8d:: with SMTP id a135mr552787oii.87.1610402476055;
        Mon, 11 Jan 2021 14:01:16 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q1sm247211oij.9.2021.01.11.14.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 14:01:15 -0800 (PST)
Received: (nullmailer pid 3135296 invoked by uid 1000);
        Mon, 11 Jan 2021 22:01:14 -0000
Date:   Mon, 11 Jan 2021 16:01:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bert Vermeulen <bert@biot.com>
Cc:     linux-mips@vger.kernel.org, Sander Vanheule <sander@svanheule.net>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] dt-bindings: Add Cisco prefix to vendor list
Message-ID: <20210111220114.GA3135243@robh.at.kernel.org>
References: <20201230212205.2605383-1-bert@biot.com>
 <20201230212205.2605383-3-bert@biot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201230212205.2605383-3-bert@biot.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 30 Dec 2020 22:22:04 +0100, Bert Vermeulen wrote:
> Signed-off-by: Bert Vermeulen <bert@biot.com>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
