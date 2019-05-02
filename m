Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B97711A9D
	for <lists+linux-mips@lfdr.de>; Thu,  2 May 2019 15:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfEBN71 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 May 2019 09:59:27 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41523 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfEBN71 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 May 2019 09:59:27 -0400
Received: by mail-lj1-f194.google.com with SMTP id k8so2263264lja.8
        for <linux-mips@vger.kernel.org>; Thu, 02 May 2019 06:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=icNXgdSoXNHduMvM9TwG5oIRWFl+dmnaL4PrkJO/4BA=;
        b=RinshLbn3poqP68nOegW4okIrkHcgwtEZnwKSQCWn+GZjYAZQcMPt0589ABE+arx8/
         BFjyOi+UmEAo6RHAwv8jP2m87ThwSAq6Tpla2zCifZYj7H9zfNsfC4zvNZh4v2enMP/Q
         Qs3NJXn5MAbicJRjRukNy6WRcjI7gvnEHOfzwZbgt8xYKgu1/jmUVWFzLUsjIK6aiEvF
         BDfXwaJn4cUdjPFU3bGhXr283KbNAJe+oCuJVb05Dkd2TSIPukhhHZpy4KUrsuttEwil
         I9agdlxn3NYLoBNVnWj8ucPQGkUCEAKDUK/WCX+jSGZDgzmIdAs29D2S+bkX1i5mCwHB
         AtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=icNXgdSoXNHduMvM9TwG5oIRWFl+dmnaL4PrkJO/4BA=;
        b=mTLsukKwm+P7316TCWMdua4aPNFgAWoM0cGX24vM4GSy3HZBMBlJTOnhkD//KsF8ic
         2d0EFheP911qZLOr5osanq33sCqI6IxiPihHzw3NpHtuE3juOgA8l+JbDrcfdBrlCOi9
         Ym05QQY6J6vJiMpGKWHH9K3dvY3Bfss9dL4S+XSHMkJJDJrTYalNoMBnVmT7isJifTdH
         MbBtY6pJ9dQlNI/cOqt+8lZu65xUbPE71SncGUqj+D/Is0cfp1QTLGXmtTCQI6UO3URE
         64z8+UH1svuPbVvYMG/wyu2xraDPhtV/fN6lvQefCq7mPpO6W2upqYH/qJeVgxvxxO8M
         o1LQ==
X-Gm-Message-State: APjAAAVssUci44BT66YDYr0zLERpm5ZblaOvEo4c8Fy50k7H8x3quHdV
        CyDlPd0+Z8eclzmu0Asd66o=
X-Google-Smtp-Source: APXvYqxPk+SRfv7KQOIT0fvL/YAgYK/ZHsionev+0hO+zTVqMmD5Tz5CoZkPjNGs1f/oEmwu5SqSXw==
X-Received: by 2002:a2e:4e12:: with SMTP id c18mr2058566ljb.3.1556805565217;
        Thu, 02 May 2019 06:59:25 -0700 (PDT)
Received: from mobilestation ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id 28sm1931305ljw.82.2019.05.02.06.59.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 02 May 2019 06:59:24 -0700 (PDT)
Date:   Thu, 2 May 2019 16:59:22 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Paul Burton <paul.burton@mips.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: Re: [PATCH 0/4] MIPS: Exception vector improvements
Message-ID: <20190502135920.3cnx7sl3iwjrzmii@mobilestation>
References: <20190430225216.7164-1-paul.burton@mips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430225216.7164-1-paul.burton@mips.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 30, 2019 at 10:53:29PM +0000, Paul Burton wrote:

Hello Paul 

> This series improves the way we allocate memory for our exception vector
> & configure it in EBase.
> 
> Patch 2 in particular is important preparation for changes being made by
> Serge Semin in his "mips: Post-bootmem-memblock transition fixes"
> series.
> 
> Paul Burton (4):
>   MIPS: Use mnemblock_phys_alloc() for exception vector
>   MIPS: Always allocate exception vector for MIPSr2+
>   MIPS: Sync icache for whole exception vector
>   MIPS: Remove duplicate EBase configuration
> 
>  arch/mips/kernel/traps.c | 63 ++++++++++++++--------------------------
>  1 file changed, 22 insertions(+), 41 deletions(-)
> 
> -- 
> 2.21.0
>

For the whole series:
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
(on kernel 4.9 and Baikal-T1 MIPS P5600 Warrior)

-Sergey
