Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD5130B3A4
	for <lists+linux-mips@lfdr.de>; Tue,  2 Feb 2021 00:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbhBAXja (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Feb 2021 18:39:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbhBAXj1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Feb 2021 18:39:27 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8275C06174A;
        Mon,  1 Feb 2021 15:38:46 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id h16so12602599qth.11;
        Mon, 01 Feb 2021 15:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=FajrV5jLxHKTArmlhLgITDySSE+0+rV8hmJ9Q4rFS7c=;
        b=msG2yug91qWFr5UXi/rWjZQBM54WlP2FqpSiTUw2N3gNhMXXWyXGjYidlcvbsD1r0P
         zNPaF0k4w/eGJunoOGnJtsgZcXGeHGfMrmy1fn/L0mV2gsLQ0P6Y+Hd/ex5bhmxlEDd/
         XteOVWKpYyqcEN+B7vwI8FrZ9RU15zyS/ARBESCeArNV7YAsmlUcR5aOvOnNMyRA0Pjf
         D1awHblBkTy/aZbPn+DTRQdyYQpNJ2yPXf8x6Od2hh10BiJES1YB4HqB9pmg5+4sprtu
         y6PVjWV7B6iLP843kwr3bfP/87R4v0dUZdGMaAY15Zj63nLmXMQUNxGYIkJ45Qgh9tsX
         jTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=FajrV5jLxHKTArmlhLgITDySSE+0+rV8hmJ9Q4rFS7c=;
        b=hbCuE4ENhXq1gyv/vVznQa2grrCncxljCIxR4Zs7ghYWMC8KZnUcpNhyME8PbNPgtH
         V4pKp4NCB6/5xqhkmQdqZjY4saCxIspB6LSz28DV1l+K2OdnFFus7japrzYlxD5S1XpX
         yW9sd0C4Mwenb0+JhQYppmdbbqGf0QEaKKvy+VGn957/2D3N1QNBXUOG9EJcNcrYdxwh
         TxuwHaxZZbQ2Gq5BGrKTnGaschbI1/BK6JLt4iTbWDxkogj+86RcpUpZdIA3hcjBg13Z
         9hEuOQb2tiafUGZEOfFWoONpyN385U363Zn7VPXwNFPRTZ1rGM6RFbVA2/EzVuomiUAs
         buow==
X-Gm-Message-State: AOAM530ZTxKd1lTjF/cz8UcguVIFGChLBPRRccd+tDWilSbBqoVjKmhI
        lBqoEezigLd9CV+JOyQA+Vs=
X-Google-Smtp-Source: ABdhPJzcVHW3kr+ZrcbTwnXe1FahAvdXfEktFgKMydJtbJlSKgys2+hI4nJzRMQGZ+TupE5r6V6iuQ==
X-Received: by 2002:a05:622a:4d3:: with SMTP id q19mr17320400qtx.316.1612222726179;
        Mon, 01 Feb 2021 15:38:46 -0800 (PST)
Received: from Gentoo ([138.199.10.33])
        by smtp.gmail.com with ESMTPSA id u133sm10615653qka.116.2021.02.01.15.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 15:38:45 -0800 (PST)
Date:   Tue, 2 Feb 2021 05:08:35 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Bert Vermeulen <bert@biot.com>
Cc:     tsbogend@alpha.franken.de, peterz@infradead.org,
        frederic@kernel.org, mingo@kernel.org, peterx@redhat.com,
        afzal.mohd.ma@gmail.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, rdunlap@infradead.org
Subject: Re: [PATCH] arch: mips: kernel: Made couple of spelling fixes and a
 sentence construction in smp.c
Message-ID: <YBiQ+8GDeyS79+hZ@Gentoo>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Bert Vermeulen <bert@biot.com>, tsbogend@alpha.franken.de,
        peterz@infradead.org, frederic@kernel.org, mingo@kernel.org,
        peterx@redhat.com, afzal.mohd.ma@gmail.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        rdunlap@infradead.org
References: <20210201111757.8019-1-unixbhaskar@gmail.com>
 <48dfc60a-c03c-f9d8-a9aa-268f6ae252eb@biot.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="137A10jDZDoLDy/Q"
Content-Disposition: inline
In-Reply-To: <48dfc60a-c03c-f9d8-a9aa-268f6ae252eb@biot.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--137A10jDZDoLDy/Q
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On 17:51 Mon 01 Feb 2021, Bert Vermeulen wrote:
>On 2/1/21 12:17 PM, Bhaskar Chowdhury wrote:
>> s/debugees/debuge's/
>
>Definitely not.
>
>
hmmmm
>--
>Bert Vermeulen
>bert@biot.com

--137A10jDZDoLDy/Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmAYkPoACgkQsjqdtxFL
KRVMXAf/TUa4fLzf3ojc3CZMQSKAHep61hWWpg5IJVgmPyxGifAkPR1VesXZQ8Fe
eTRLTNT0FPCJcDa41ylAj08Z6T7HPe1upO5CqGqzm+x0cxf7FGwq+FsYwytSkpE/
fN4VETOc2wDKtNDTirDjGQmb5gLEyHHkgjCY8N5XtFUptYfz2dZ3kg41YYnei12L
1jvvXrp3Vz/Sktg6UjCi3fFuNovqpKPCdBPaXa8WL1JYsoE335fc9wG5J+P18lnr
aPcn7lNOymU5/SIhqHgUnrbeBbvMGI8bWmaQ9g8rOkXBWaKUhd4pRol6qHpyF/Gv
bf7RPbQPJPbm5iQSsKwfv5eXPysEZQ==
=vT0I
-----END PGP SIGNATURE-----

--137A10jDZDoLDy/Q--
