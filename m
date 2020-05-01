Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4529D1C0C18
	for <lists+linux-mips@lfdr.de>; Fri,  1 May 2020 04:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728009AbgEAC24 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 22:28:56 -0400
Received: from ozlabs.org ([203.11.71.1]:38821 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727949AbgEAC24 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Apr 2020 22:28:56 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Cx5B5W4lz9sTP;
        Fri,  1 May 2020 12:28:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1588300133;
        bh=+bqrLgcGFCf99Uu0U3dlp7gViTjK7ah+NjB2S1m2Aik=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=C40FoaSbb6Q7wxAomTtdxarjIzmNFst3ymTI/G0w+2Kk4NeklpK6MsprW4aeFuOL/
         TkwCTTk/7ic3XMxxS6CK/X3oa/bQeVyESN7G+SaFXOX7im9fHNKTrHsMKV+kWikDkZ
         F4EQg/axXQnDydjHMY8YK4m1w7/g6KQLwOau55AA3fV9h56VfUn56xpldCbghHJ2Ak
         2N9znvLw+oscvvZuzcfTam9qWHZe31okh0MKjz+kAwW42XWB85OVqyucfXymD7ELvU
         m5F7EwikPo5WIhIxh6Mz3Olzdcc/jvC1qxexqP0q2olewhZMqGmdXIZmIE3aXRiBqJ
         5a8C0skKdBJKw==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     ira.weiny@intel.com, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Huang Rui <ray.huang@amd.com>
Cc:     Ira Weiny <ira.weiny@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Dan Williams <dan.j.williams@intel.com>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH V1 00/10] Remove duplicated kmap code
In-Reply-To: <20200430203845.582900-1-ira.weiny@intel.com>
References: <20200430203845.582900-1-ira.weiny@intel.com>
Date:   Fri, 01 May 2020 12:29:00 +1000
Message-ID: <87imhge6c3.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

ira.weiny@intel.com writes:
> From: Ira Weiny <ira.weiny@intel.com>
>
> The kmap infrastructure has been copied almost verbatim to every architecture.
> This series consolidates obvious duplicated code by defining core functions
> which call into the architectures only when needed.
>
> Some of the k[un]map_atomic() implementations have some similarities but the
> similarities were not sufficient to warrant further changes.
>
> In addition we remove a duplicate implementation of kmap() in DRM.
>
> Testing was done by 0day to cover all the architectures I can't readily
> build/test.

I threw some powerpc builds at it and they all passed, so LGTM.

cheers
