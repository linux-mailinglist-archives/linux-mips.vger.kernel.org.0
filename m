Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3031813EC
	for <lists+linux-mips@lfdr.de>; Mon,  5 Aug 2019 10:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbfHEIGe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Aug 2019 04:06:34 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46428 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726656AbfHEIGe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Aug 2019 04:06:34 -0400
Received: by mail-lj1-f196.google.com with SMTP id v24so78636758ljg.13
        for <linux-mips@vger.kernel.org>; Mon, 05 Aug 2019 01:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4jotGUYX3HDjIjrPWkq93S31gJkGTLLQx5i8QIerKxE=;
        b=OKXu80bhtKFjmm2MpkIDYVWmXqi7Y+Xjky/uEczjP2Zl5b7vO97lSZ4GxsSOJjZduQ
         VgPXNXexmCAKG6Z+637VhMExKFfEjxuDw3H3mRcIbO3qLRCxF1TJiOxHnvXkyL1xl5hz
         9tSzcuFZEaM47GjqXTJ6n5YnEqhbYAzKlpVrDHKCy9VeCfnp53elgyy+VMv+lz31Ers7
         Eic301vKwslj47MtbPz81DyzufZoA3sVB/fmBoMeBi2wwb65qyfXQctIncrR9gNzSMvv
         ew3Ty0ZvYjqCUhy9kY7gTZ+iW4B61AZpbS675ligIs/I+dyRKPx83vFtsSrTsvbz0lFJ
         WX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4jotGUYX3HDjIjrPWkq93S31gJkGTLLQx5i8QIerKxE=;
        b=cdSlEiwsJW9ArEwNxOGW+YIYAYdPT2iu5cgspgEgDsCllHcGO7tFXSNYy/qC7HfEaI
         jF6fmuFf33BqPPsEZbpCWZYn535r2L+GAJpMTxlC9CARzckVw3SfGbph+1F9K+lS9X+n
         5xIgrqiRIdWen6P0MO3/hX7en8RxPizEAinel3UzJcOjjaBCpJYsJDGQ6MT99wkAuvd2
         ZzdATL+VfOz7h9y9QOMzdfr9LbdPIUQy1pvuVLYAT6+y8+hicqtxQa22QSvS4oR8xW7n
         M5sdeHZLALwWvH0A4nkbnODvghlO/P8FGetMJthZS1Qh4EeEGW8TmkbF2qNYqi/MmqM1
         11IA==
X-Gm-Message-State: APjAAAUa5uizo9iPpYtGY88iaktZHhyl1jyypQZnLExCCa1o4PJ0LK3E
        k3FqzycshveewCVotSDQv7kOIQ==
X-Google-Smtp-Source: APXvYqyZpQSVk777vhC2lpS6B8C38YOlvgzOQV2vQdpdrwUMZBvpR5l2r7dZg3bY6N4q4hVA/QRa0Q==
X-Received: by 2002:a2e:9b48:: with SMTP id o8mr78054712ljj.122.1564992392086;
        Mon, 05 Aug 2019 01:06:32 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:44f5:2f9a:806:ec14:8a98:a30c? ([2a00:1fa0:44f5:2f9a:806:ec14:8a98:a30c])
        by smtp.gmail.com with ESMTPSA id l24sm17213019lji.78.2019.08.05.01.06.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 01:06:31 -0700 (PDT)
Subject: Re: [PATCH 2/2] MIPS: remove support for DMA_ATTR_WRITE_COMBINE
To:     Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
Cc:     Shawn Anastasio <shawn@anastas.io>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linuxppc-dev@lists.ozlabs.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20190805080145.5694-1-hch@lst.de>
 <20190805080145.5694-3-hch@lst.de>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f02604c5-dbea-e64e-cfb7-3a002b0da9a6@cogentembedded.com>
Date:   Mon, 5 Aug 2019 11:06:24 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805080145.5694-3-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 05.08.2019 11:01, Christoph Hellwig wrote:

> Mips uses the KSEG1 kernel memory segment do map dma coherent

     MIPS. s/do/to/?

> allocations for n

on-coherent devices as uncachable, and does not have

    Uncacheable?

> any kind of special support for DMA_ATTR_WRITE_COMBINE in the allocation
> path.  Thus supporting DMA_ATTR_WRITE_COMBINE in dma_mmap_attrs will
> lead to multiple mappings with different caching attributes.
> 
> Fixes: 8c172467be36 ("MIPS: Add implementation of dma_map_ops.mmap()")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
[...]

MBR, Sergei
