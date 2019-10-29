Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1E3E859D
	for <lists+linux-mips@lfdr.de>; Tue, 29 Oct 2019 11:31:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731011AbfJ2KbO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 29 Oct 2019 06:31:14 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:44610 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730952AbfJ2KbO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 29 Oct 2019 06:31:14 -0400
Received: by mail-qt1-f195.google.com with SMTP id z22so19351973qtq.11
        for <linux-mips@vger.kernel.org>; Tue, 29 Oct 2019 03:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=9SS4b78ehrP4a9/DZbJX4AGCB0l2oYRtncqtM2VcVgs=;
        b=G/LkZ5EFLI13fNYweg2QLrX9wPwyX1HFJIpSnMQHTrMXQvOr8WcBlj7L6PpPDNjdgP
         i5InJ9pIYo4M2+ahXyCmJkm0/aSmAFV1b0ddTRW1LgRG7OVGwCri8wGtJhq7q7n0OHXS
         /62wwsP9sjkBXi1sfsKUBwKdoX3XI/7IX8CepjzvKNmSryJQnKF34LTh2GQ9WhtDP2dt
         IXSVXKbxiNcS5b+rYkiVMk/YKYGmnfMv31SeMxHd7e0Hp2u4HSyq7youtj+T3jqrMDT3
         TABjTwTyDtWr5DElB4lPasN8uyXQjZI6Au4SUlUuoJnmXJBOg31XRn9SRwxaflUvjklQ
         6j8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=9SS4b78ehrP4a9/DZbJX4AGCB0l2oYRtncqtM2VcVgs=;
        b=XgfqlR4fbcmrXRk/9Y6pkUPMsHYWPMQxofftWOnfUYqQdSVmFhG/ySGLQWRPgAJSIk
         na9bjvERPPp/DQQtnPlio0LymubuDS39Iakd6W50L5tnowQLT2Gy4+MOkYo6mZyKlTfv
         IWUBXLocb/K9qvhPJGlvrzCG6Kkz41ao4vxbs0DI5LPflwCbTcGy3cIYUZEcC6loJAeV
         Aut+57C7zMUy3zCz1O93BcQxV8y3ZUYZ1UuMJBB+NOpfBZKt7TFgXFIniRMBOCmT6H82
         LjWrLSNgSpH0rpVuljS4FIFz7eC6o/hFIo+CTI6o33tycFY360xl2C7tzvWh6rwEaIX7
         7LXQ==
X-Gm-Message-State: APjAAAUN6ifbW1ZOaZp65x3xHcJhjHiIdyBf0yTamncB3N5fFqojuVVh
        vRIgekNGMUcW+CGVgt5DtG3s9g==
X-Google-Smtp-Source: APXvYqxu87KxuRTj39OXWAVjw/WFzSDMbE3Up95oGqmF/PZSf0Vx1vPkAAaomtV6kZQFzmiTSl4zEw==
X-Received: by 2002:a0c:f6d2:: with SMTP id d18mr6856697qvo.155.1572345072935;
        Tue, 29 Oct 2019 03:31:12 -0700 (PDT)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id t1sm7346140qkm.121.2019.10.29.03.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2019 03:31:12 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V8] mm/debug: Add tests validating architecture page table helpers
Date:   Tue, 29 Oct 2019 06:31:11 -0400
Message-Id: <B6AAFA3F-745D-48E2-98CC-CFB30934CE39@lca.pw>
References: <1572240562-23630-1-git-send-email-anshuman.khandual@arm.com>
Cc:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Michal Hocko <mhocko@kernel.org>,
        Mark Rutland <Mark.Rutland@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Steven Price <Steven.Price@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Kees Cook <keescook@chromium.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Matthew Wilcox <willy@infradead.org>,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vineet Gupta <vgupta@synopsys.com>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <1572240562-23630-1-git-send-email-anshuman.khandual@arm.com>
To:     Anshuman Khandual <Anshuman.Khandual@arm.com>
X-Mailer: iPhone Mail (17A878)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> On Oct 28, 2019, at 1:29 AM, Anshuman Khandual <Anshuman.Khandual@arm.com>=
 wrote:
>=20
> This adds tests which will validate architecture page table helpers and
> other accessors in their compliance with expected generic MM semantics.
> This will help various architectures in validating changes to existing
> page table helpers or addition of new ones.
>=20
> This test covers basic page table entry transformations including but not
> limited to old, young, dirty, clean, write, write protect etc at various
> level along with populating intermediate entries with next page table page=

> and validating them.
>=20
> Test page table pages are allocated from system memory with required size
> and alignments. The mapped pfns at page table levels are derived from a
> real pfn representing a valid kernel text symbol. This test gets called
> right after page_alloc_init_late().
>=20
> This gets build and run when CONFIG_DEBUG_VM_PGTABLE is selected along wit=
h
> CONFIG_VM_DEBUG. Architectures willing to subscribe this test also need to=

> select CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE which for now is limited to x86 an=
d
> arm64. Going forward, other architectures too can enable this after fixing=

> build or runtime problems (if any) with their page table helpers.
>=20
> Folks interested in making sure that a given platform's page table helpers=

> conform to expected generic MM semantics should enable the above config
> which will just trigger this test during boot. Any non conformity here wil=
l
> be reported as an warning which would need to be fixed. This test will hel=
p
> catch any changes to the agreed upon semantics expected from generic MM an=
d
> enable platforms to accommodate it thereafter.

This looks like a perfect candidate to streamline with the new kunit framewo=
rk, no?=
