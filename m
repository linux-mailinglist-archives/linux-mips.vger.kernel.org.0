Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86EC2183F51
	for <lists+linux-mips@lfdr.de>; Fri, 13 Mar 2020 04:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbgCMDJi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Mar 2020 23:09:38 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:40858 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726331AbgCMDJi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 12 Mar 2020 23:09:38 -0400
Received: by mail-qk1-f196.google.com with SMTP id m2so10201895qka.7;
        Thu, 12 Mar 2020 20:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=y+mnyt60IrxwqY8gBOAa8U5kdnGh5BymccVlM/S5jFY=;
        b=Nz4f66aNz6UTRMnsPJWo6PaiGAphRvXBFNmEApfnqp0ngUNkyOWys98tc5BOTi5y5v
         Bnf264UnBx3FcBO7QPuz1olSvo4ASZVq8wQib9InhpdjcHH1yYz1Smn9Ty7ZHX+SdvTy
         ZP/vRMW2AzJP9RDCy7o9AnrqHADLkvqqVW7ml/JDCMcm3yXNN62SzTqEy0BigZ8cgyA6
         N0Zi4hAHTATlw3dscZvq+gt/fURHDj8ka8zKM7cmYAS1QCFR5f0T6d3urRSCMivkfoXP
         vgf/IAN33DjVgBj6PoC9W+T+/3ucq/F8oiG9rUjN/VBXiuuwGUiStNOpTLnOy8WTaIFY
         nBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=y+mnyt60IrxwqY8gBOAa8U5kdnGh5BymccVlM/S5jFY=;
        b=NeV87iIeZxrpQDRedbeS6SVmoAYRA/XsAQrK5mIhPmQcW20IWA/3avNh5byyNS5/Eg
         PLvh1s7MYV4g6KAb/FkqyHwu6zTisRo2/Pt3VpvKYY3zM4EPiWglkcAwxrpzvv2r4qxl
         dryH7Ai4DLOprkCTV8K68ntfumsku1uRbqkgexXSKtOR4Mc8fmHvivvszIX8qLW8UlpN
         FkyCf7GnXoy95CURrrdzDs7LRv/TIr+yvz6d5GRxL4bVJM3/rjp6f1OR31wmOC3Y+4ar
         HddGxK99ki9KBBDSXjrbmWPsGtRo9iiFuXdXeDNAeTROU41ICcmvLLNSOXzQNbfXBUod
         jGdg==
X-Gm-Message-State: ANhLgQ1mByARvrMuHNip62SHiiYlcR7hBOeuvIBBkumuherl3Qp6T/YB
        Z7UKGCuPxWPd2+yyAjAnCarwi0Yd
X-Google-Smtp-Source: ADFU+vu+aRNTNzG+JZz8Cif9Nt9Ku+azqqksRXrAV27uFGOEeGQcvkMUMIIc6rVKT9cqdZgFUfJKDQ==
X-Received: by 2002:a05:620a:1236:: with SMTP id v22mr10999159qkj.101.1584068977427;
        Thu, 12 Mar 2020 20:09:37 -0700 (PDT)
Received: from [10.0.0.29] (pool-98-118-94-114.bstnma.fios.verizon.net. [98.118.94.114])
        by smtp.gmail.com with ESMTPSA id m92sm2452426qtd.94.2020.03.12.20.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2020 20:09:36 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Kamal Dasu <kdasu.kdev@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2] MIPS: c-r4k: Invalidate BMIPS5000 ZSCM prefetch lines
Date:   Thu, 12 Mar 2020 23:09:35 -0400
Message-Id: <2388CCC9-8C2A-4907-988D-7A239DE0DD6C@gmail.com>
References: <20200311214432.GA5900@alpha.franken.de>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        linux-kernel@vger.kernel.org
In-Reply-To: <20200311214432.GA5900@alpha.franken.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
X-Mailer: iPhone Mail (17D50)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is needed on dma reads from device. =20

Kamal


> On Mar 11, 2020, at 5:44 PM, Thomas Bogendoerfer <tsbogend@alpha.franken.d=
e> wrote:
>=20
> =EF=BB=BFOn Wed, Mar 11, 2020 at 01:54:23PM -0700, Florian Fainelli wrote:=

>>> On 2/7/20 2:33 PM, Kamal Dasu wrote:
>>> Zephyr secondary cache is 256KB, 128B lines. 32B sectors. A secondary ca=
che
>>> line can contain two instruction cache lines (64B), or four data cache
>>> lines (32B). Hardware prefetch Cache detects stream access, and prefetch=
es
>>> ahead of processor access. Add support to invalidate BMIPS5000 cpu zephy=
r
>>> secondary cache module (ZSCM) on DMA from device so that data returned i=
s
>>> coherent during DMA read operations.
>>>=20
>>> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
>>=20
>> Thomas can review and apply this patch? Thank you!
>=20
> looks good to me. I only wonder whether r4k_dma_cache_wbinv() also
> needs this ?
>=20
> Thomas.
>=20
> --=20
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily=
 a
> good idea.                                                [ RFC1925, 2.3 ]=

