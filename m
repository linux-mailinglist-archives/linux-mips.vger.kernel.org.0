Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34DF19ECB6
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2019 17:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbfH0PcG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Aug 2019 11:32:06 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:46864 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbfH0PcG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 27 Aug 2019 11:32:06 -0400
Received: by mail-oi1-f194.google.com with SMTP id t24so15245330oij.13;
        Tue, 27 Aug 2019 08:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=r9TYKlSBDRjfOFH30TXG0EJzSnP77+Ixkulyezxixts=;
        b=i0WM4v+1yhkiqjhHOMAGKFbZArF3cXWZ1RKuy+n+OJ2eMecSiLIoFI9RzSUVUKa+kH
         YWXN7ELz/v8IC/MkoqE2gOr4xWIaZAkOIlFhFQ1QRWjOIssx1JiUi+X6rmWLzeTwggov
         YDAirCljBTb2u9qjD3HX3ykQ6KfhIyPq+Teupar+1bLHZSAwSfotqj9A16mnC4XVrRgb
         PSxdePY/SS6HuukqhQLH76WkQk8KbnfhQXRmvUnZkwQCmn0M+0TFjLys9dWc58D0gZK9
         Ot8MyDvpC1gFJFG29jjlLC2DCb5Q47K0s66yq/1H7VgDCbeapeBblOT3i43PQzYn/hUs
         xmuw==
X-Gm-Message-State: APjAAAWLGbxCwMfi0eTrVcuRfUPolYch4+gOnebaXghd30GpmnjvPpyW
        psvv+aOmlQ//bxk0lTIhNw==
X-Google-Smtp-Source: APXvYqwuFv8RbGio3uYVQV9N/xAcDJJRDCudXGzbh9LrAFoKhyXN84f+n2y0X0k8StIIs/rbB+GZDQ==
X-Received: by 2002:aca:cfcb:: with SMTP id f194mr17381840oig.103.1566919925795;
        Tue, 27 Aug 2019 08:32:05 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y88sm5542390ota.32.2019.08.27.08.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 08:32:05 -0700 (PDT)
Date:   Tue, 27 Aug 2019 10:32:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Stefan Roese <sr@denx.de>
Cc:     linux-mips@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4 v4] dt-bindings: mips: Add missing mt7688a-soc
 compatible
Message-ID: <20190827153204.GA2489@bogus>
References: <20190812103655.11070-1-sr@denx.de>
 <20190812103655.11070-2-sr@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812103655.11070-2-sr@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 12 Aug 2019 12:36:53 +0200, Stefan Roese wrote:
> This patch adds the "ralink,mt7688a-soc" compatible to the ralink DT
> bindings documentation. This compatible is already used by some MIPS
> boards (e.g. omega2p.dts) but not yet documented. It will also be used
> by the upcoming "GARDENA smart Gateway" support.
> 
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Paul Burton <paul.burton@mips.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
> v4:
> - New patch
> 
>  Documentation/devicetree/bindings/mips/ralink.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
