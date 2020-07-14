Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39A8421FEE2
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2020 22:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727898AbgGNUte (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jul 2020 16:49:34 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:46305 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbgGNUte (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Jul 2020 16:49:34 -0400
Received: by mail-io1-f66.google.com with SMTP id a12so18744412ion.13;
        Tue, 14 Jul 2020 13:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=d2HaDm+VEtYJahHaKgiPbphztVOLJZj8CA+1dM4wOCE=;
        b=SDFt0YciG9523qY3yjE7OSCcF+xCl6jnlxf1LQ9tNMbGkINCCEI9tsyYMjQ9lps6DT
         Ah+TSaZo/soa7h7CYge42Y7OhtMD69OKyvWZdh40CmT1l6MaZMZEGhfae5Ix2oVdYt8D
         bKLlarKoQudes0GZp0lef4BVBasViJULpi8n4iG2p4pfvRXF0iSI2yiKNWuDN3rrBrwa
         UWAaP8ouDCFKo9mUkaEnGmM0t5qDZhS3M15vi3bFf8irpIbEOeMy1AflnyhVt4zuiKBp
         iD8QNNRTBzU/p6vC+3rw8ilhEdoRK0jPV3T2lGl6ZDSALDVYovljFgP+T1437B3PXgPQ
         zR0Q==
X-Gm-Message-State: AOAM530XiH+KP3l1u8c/Yz9cYqQgP8nTjQ5g6Ud8f+NOsu2v79RoHwrP
        pGivVvnYMrpZIauSKzvbqA==
X-Google-Smtp-Source: ABdhPJyQ0S0nRzJ5FI00qL1pyvQfH21VLBuguFUC+NFVEbdSGAODtrOeSi3bFpfTXJ3phkt+NDLt3g==
X-Received: by 2002:a02:4083:: with SMTP id n125mr7818785jaa.83.1594759773409;
        Tue, 14 Jul 2020 13:49:33 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id k1sm32341ilr.35.2020.07.14.13.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 13:49:32 -0700 (PDT)
Received: (nullmailer pid 2894129 invoked by uid 1000);
        Tue, 14 Jul 2020 20:49:31 -0000
Date:   Tue, 14 Jul 2020 14:49:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-kernel@vger.kernel.org, yanfei.li@ingenic.com,
        dongsheng.qiu@ingenic.com, zhenwenjin@gmail.com,
        rick.tyliu@ingenic.com, paulburton@kernel.org,
        sernia.zhou@foxmail.com, ebiederm@xmission.com,
        aric.pzqi@ingenic.com, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        ak@linux.intel.com, paul@crapouillou.net, robh+dt@kernel.org
Subject: Re: [PATCH v4 2/5] dt-bindings: MIPS: Add X1830 based CU1830-Neo and
 fix bug in CU1000-Neo.
Message-ID: <20200714204931.GA2894075@bogus>
References: <20200714053229.33195-1-zhouyanjie@wanyeetech.com>
 <20200714053229.33195-3-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200714053229.33195-3-zhouyanjie@wanyeetech.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 14 Jul 2020 13:32:26 +0800, 周琰杰 (Zhou Yanjie) wrote:
> 1.Add bindings for Ingenic X1830 based board, prepare for later dts.
> 2.The CU1000-Neo board actually uses X1000E instead of X1000, so
>   the wrongly written "ingenic,x1000" in bindings should be changed
>   to "ingenic,x1000e", the corresponding dts file modification will
>   be made in a patch later in this series.
> 
> Tested-by: 周正 (Zhou Zheng) <sernia.zhou@foxmail.com>
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
> 
> Notes:
>     v1->v2:
>     No change.
> 
>     v2->v3:
>     No change.
> 
>     v3->v4:
>     Modify the commit message and add the change description
>     for CU1000-Neo.
> 
>  Documentation/devicetree/bindings/mips/ingenic/devices.yaml | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
