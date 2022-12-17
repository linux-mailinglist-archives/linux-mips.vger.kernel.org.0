Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABFA064F669
	for <lists+linux-mips@lfdr.de>; Sat, 17 Dec 2022 01:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiLQAmV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Dec 2022 19:42:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiLQAmU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Dec 2022 19:42:20 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5076E4081D
        for <linux-mips@vger.kernel.org>; Fri, 16 Dec 2022 16:42:18 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id a16so5823254edb.9
        for <linux-mips@vger.kernel.org>; Fri, 16 Dec 2022 16:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rammhold-de.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:references:in-reply-to:subject:mime-version:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1QFKv2TWTiAAUJtUNn93KfAKVJcdR7iRnXXIRoZLyMw=;
        b=OTXV3ptGWNYqx2UGC2rImTpDTUqU+wDZrKWBdy/UNAoeJvPRPrVSz1tG1jGOl8Ce3e
         s6M+0zp3iE/xPvJ46gLuHDMM+X+dYn3oSIIkuoF8AqAxuwdnMf3jhdxb358LL+YJDcfS
         dZ7iY559N/VzN10NYUT2zpg7KukATI1WYLCO3n8YoWy1L2Vv1QLCrv12PzmH3hpdw7+S
         rHWJyzzNPFxdyh5dz4Jy/tuCgfdBOqEUZVKTu3jNQXrzZT20P3EidtaaPA+3wqG2iGvD
         h5s1tkyGIxQOWmtZwzxznuihpx9A3d7YWy8DoYbCcGpmaMmXppEFilwGAndn5ZPfW9CD
         gezQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:references:in-reply-to:subject:mime-version:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1QFKv2TWTiAAUJtUNn93KfAKVJcdR7iRnXXIRoZLyMw=;
        b=b9sB84ol3RD8k5goGaqvDD0TTB5QzqrCv9JzQPiTJ/hhNFSqVtnIInccRw6Zai38In
         Y4lhCEBVAeimduUfc0yCGaAuMwtgyGANRY5xW1kM45/NmMuqtWVhZe/BASTewaQmlbeD
         4nUIytyNgyU1j4aoVu/WEUeuVzvTKb5QyOtlEi0HmsICzxSklsgRDhNX2PR/gDYzRppM
         3XdLvosLE/xsTzlqXHD6Q8MxgxhAy3kqA/LyS48TRzbrhj9lFoBM4PjttzMUkMnlC3z5
         RGeS6JQv1ywNUxjYdLhEhHXPsvGO8obED9VOMGTIaq1k04ua2C9lvUaNUEF9r7+FI9AH
         +5fw==
X-Gm-Message-State: AFqh2kqBIwD9jXsRl0srZRkj86FTjbS5zSUrrGiSiQchAZ4ruylLVQWD
        /VFkMO3OdIFFWNTbHq0y1bm1XA==
X-Google-Smtp-Source: AMrXdXuEXjxQv82egRwfXB6YAxYwW32Z33izAMO7cRGkThTOjWfh0A7Qji8VV9ypvbxJ6Vi/3fflkA==
X-Received: by 2002:a50:ed81:0:b0:477:ff25:867a with SMTP id h1-20020a50ed81000000b00477ff25867amr97915edr.12.1671237736873;
        Fri, 16 Dec 2022 16:42:16 -0800 (PST)
Received: from localhost ([2a00:e67:3f2:a:8c01:9c4e:459b:314f])
        by smtp.gmail.com with ESMTPSA id j9-20020a1709066dc900b007ad84cf1346sm1379556ejt.110.2022.12.16.16.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:42:15 -0800 (PST)
From:   Andreas Rammhold <andreas@rammhold.de>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mips@vger.kernel.org, Frank Rowand <frank.rowand@sony.com>,
        linux-kernel@vger.kernel.org, John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Frank Rowand <frowand.list@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [PATCH v4] of/fdt: Rework early_init_dt_scan_memory() to call
 directly
In-Reply-To: <20211215150102.1303588-1-robh@kernel.org>
References: <20211215150102.1303588-1-robh@kernel.org>
Date:   Sat, 17 Dec 2022 01:42:14 +0100
Message-ID: <87bko2x3mh.fsf@rammhold.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


Hi,

I've just debugged an issue that I traced down to this commit.

My mt7621 based board relies on the soc_info.mem_detect function for
memblock init which is never being called again with this patch being
applied.

The code in the original patch as well was on 6.0 doesn't allow any of
the other (fallback?) memory initialization code to run as
early_init_dt_scan_memory() always returns 0.

Was this an oversight in the implementation or are some follow-up
patches missing? Perhaps the code just has to return a different
value when it has found some blocks of memory that should be used?


Andi
