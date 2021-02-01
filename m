Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0CB30B3A6
	for <lists+linux-mips@lfdr.de>; Tue,  2 Feb 2021 00:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbhBAXkt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Feb 2021 18:40:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbhBAXkr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Feb 2021 18:40:47 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB248C061573;
        Mon,  1 Feb 2021 15:40:07 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id k193so18179501qke.6;
        Mon, 01 Feb 2021 15:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z4cc0U8qP2meyL0EtHUXKs1H7awSTevJKAbNY29G1Go=;
        b=V/+N+2jw1nsdXybBmCM6MRJEYUXsgRbxyLLGs/aTbjbkcBD6fSAzpxNY8uEYbp8Kux
         oLW5NMIymaWJ4ldyYuySdzGAFK1XsQztPyk9BkOJxN0hnl5R/SBob9Ac78Sf56l/6Jzy
         EioG3sSxk+amBHjsiKuz35I9LeZ9JDGCpndsc0GsdGTq7ct41voWYv/G/H7W5c/u50t9
         WxyCrLFE5aT6X5pmG1lf0gOsuXTmCdvAowY2/86X28pIrdjvaEONM6ReM57EKYMsSkYU
         vUe7CWsmReYWcwOlm6TN/bhYHO1eVDe7Evan250dCBf7wTFSd2ff7cbKDKD9QnSN8j0T
         ABSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=Z4cc0U8qP2meyL0EtHUXKs1H7awSTevJKAbNY29G1Go=;
        b=XFqC+k6hf8qAyvhqKv/FFGP8g3YUmPK71iFTtr2DVl45nmqUCE7vI+6X6U/2M27TIZ
         lr6MLJkVYLeKBMiMunGh6sc+kzE2giYUDRdJNxWAqCIkXH0lesUTRJH6jsf4JryFgvua
         W5Rhi4gY8cBRCo1dqorg3Y4l4vIG14wvgH4oEJXxvLTXjMWK+D8OmLWdBhz8oLpZxUZ6
         oTdFx75yjg/nOLDaKgIgbZ55h08HqCbfGqA0H2Z9BeWz5WyKfR7KN1hHoPxnX8iWGif6
         bZ/9fmlZn9hyBFjlvKhfQiA95glMaOun8J6CU/PrOaZE4bE6CeEngaTld3F0gWfRJBwA
         rluA==
X-Gm-Message-State: AOAM532FRRyaEbPBm6v0/tzhTC3US216nX92xJGh76/L9B3vLEfY2OOl
        o2ZXiXhKevP+lq2ihSkBAWDrQSPjok7jur//
X-Google-Smtp-Source: ABdhPJyE2bhMjj2y7UuheY+/DllURYvmeRfnFL1w+TOFlQ+VEqprPswyVjfEutDOPfeMu6UvhKSCYg==
X-Received: by 2002:a37:4ecd:: with SMTP id c196mr18283462qkb.264.1612222807047;
        Mon, 01 Feb 2021 15:40:07 -0800 (PST)
Received: from Gentoo ([138.199.10.33])
        by smtp.gmail.com with ESMTPSA id d9sm15576637qko.84.2021.02.01.15.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 15:40:05 -0800 (PST)
Date:   Tue, 2 Feb 2021 05:09:54 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Bert Vermeulen <bert@biot.com>, tsbogend@alpha.franken.de,
        peterz@infradead.org, frederic@kernel.org, mingo@kernel.org,
        peterx@redhat.com, afzal.mohd.ma@gmail.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arch: mips: kernel: Made couple of spelling fixes and a
 sentence construction in smp.c
Message-ID: <YBiRSkWH4KMizfRH@Gentoo>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Bert Vermeulen <bert@biot.com>, tsbogend@alpha.franken.de,
        peterz@infradead.org, frederic@kernel.org, mingo@kernel.org,
        peterx@redhat.com, afzal.mohd.ma@gmail.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210201111757.8019-1-unixbhaskar@gmail.com>
 <48dfc60a-c03c-f9d8-a9aa-268f6ae252eb@biot.com>
 <5b12db9b-7c06-faf7-1816-09453f48eb1e@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uSVRZ0TZIbzHHegB"
Content-Disposition: inline
In-Reply-To: <5b12db9b-7c06-faf7-1816-09453f48eb1e@infradead.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--uSVRZ0TZIbzHHegB
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On 09:51 Mon 01 Feb 2021, Randy Dunlap wrote:
>On 2/1/21 8:51 AM, Bert Vermeulen wrote:
>> On 2/1/21 12:17 PM, Bhaskar Chowdhury wrote:
>>> s/debugees/debuge's/
>>
>> Definitely not.
>>
>
>and preferably "inter-CPU".
>
Haven't thought about it ..will fix it , Randy!
>--
>~Randy
>netiquette: https://people.kernel.org/tglx/notes-about-netiquette

--uSVRZ0TZIbzHHegB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmAYkUoACgkQsjqdtxFL
KRV44AgAj9mPVL4f6HzRZMi2NLfWzlua1/Q+QpVdAf2LpRP/uKU+ZpoSzLcy8JLv
iE7rD+p6Tllj9WTyvsgZ9DYT4a6ILrMn7Ak3gfbN/7zuTNnzaXdDZhjMYwC08fzT
senihtshKX16/H29vZ1A54NRgLGHobTkjjftS5PBryThAguW02agUNEi/esugugb
tXRh24Eg5xv1kqiGgrp0KmAtUoJcn1J9rQBcP5qAY2QitbgJDb/0YtTtLNK5u8Tb
cpvZr7fTrqEzTxo0Ah6HvLtWlPdU/PdB1fPhP8e79oc0vNDmz4OoBKYH87eRIky7
981F1mq3U6Vuhw4h3BMAy3CY8LJAYw==
=n1Cp
-----END PGP SIGNATURE-----

--uSVRZ0TZIbzHHegB--
