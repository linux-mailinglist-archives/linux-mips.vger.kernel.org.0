Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E013214AF25
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2020 06:48:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725799AbgA1Fsd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jan 2020 00:48:33 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:42310 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbgA1Fsd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Jan 2020 00:48:33 -0500
Received: by mail-qk1-f196.google.com with SMTP id q15so12232461qke.9
        for <linux-mips@vger.kernel.org>; Mon, 27 Jan 2020 21:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=LCR4yoPyKXUQ+V6Rzx8Vr1pGJBzG7ybCO5xmGhWVO2E=;
        b=Hma1sjKpCAmCNDeQeafPYa2ae6jBDESB1PCm6wfy4m1d7M9+BWh8FVkywYWY7ykCiy
         SzQx25lgeC+4duHJWx6KqUIh8QXTw8di5MeaGwQuHHn89Nhc7uYjdWvvsMbKeA7vFD83
         eZ0ttxqv+O0UBv0Q1ELfjNP83to7CnSAWkh7s2C27oDB+u7jHIZRBxLZHGidOdsQf1JK
         mEEo4/yiVKjxGyBlmRHpRnDqvkuHhNTxRoPqy1Zumzpfc60DAz3G+S+hPw5+FUChoT/q
         bS0YqS6g/Diq0QYdhlCFXqUUyepH5ufSRHLX0WMtxLjOyn6wC8W9mPq32swU9Z657Mb6
         aYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=LCR4yoPyKXUQ+V6Rzx8Vr1pGJBzG7ybCO5xmGhWVO2E=;
        b=F2dYZvXxGaYpN9i7X30uvhxfwukYIKhUrexmK8tX6xLDtCd+H4tkxr1uU/45IDu2ud
         nKbkqz4OmNqftgVXxeZPMmtA/PYCuiM4Q304P+lVJA9y7GzJS66XptviQK8rL/aD3Aff
         BflO/y0GIH7TFEfuYrMa1Wl9UvhrrlHo9hyo8aTFM7Du4E4+VEJr5wm8qDcjNa9O2dW+
         9tnRUhUVR+g9gzP7vvL8PrbnJfb9pDD7p/J4UtkSNLDenLtiVbj7NOO25Mf6yNJ2a/nu
         75PhTfnnEkccmDNGpZuFwhJStTjabG/6+8mqIbQZZ/MxbwIEqAfQ/NmBtXG/f8USY0cm
         Q0/g==
X-Gm-Message-State: APjAAAXPjZEOUU4/1jg4eLAVHI/94u/cG24uTktF4a5EIS7T8x5Ht7dQ
        SybhKD2HgCvjM4O5QgIuQOHaKw==
X-Google-Smtp-Source: APXvYqwn3oHOOTfkm4bMswvjR/8+st1VKZNpzuQd0q1CmHzfURBt8o3+PL4pjZF1Mk5vBV26vMgvyQ==
X-Received: by 2002:ae9:edc8:: with SMTP id c191mr20758894qkg.227.1580190511462;
        Mon, 27 Jan 2020 21:48:31 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id 8sm11519536qkm.92.2020.01.27.21.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 21:48:30 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page table helpers
Date:   Tue, 28 Jan 2020 00:48:30 -0500
Message-Id: <EE5B936C-121E-4322-A285-603D82D59B3A@lca.pw>
References: <012158b7-a40e-050f-cd1b-d6ce7faf042f@arm.com>
Cc:     Linux-MM <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
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
In-Reply-To: <012158b7-a40e-050f-cd1b-d6ce7faf042f@arm.com>
To:     Anshuman Khandual <Anshuman.Khandual@arm.com>
X-Mailer: iPhone Mail (17C54)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> On Jan 27, 2020, at 11:58 PM, Anshuman Khandual <Anshuman.Khandual@arm.com=
> wrote:
>=20
> As I had mentioned before, the test attempts to formalize page table helpe=
r semantics
> as expected from generic MM code paths and intend to catch deviations when=
 enabled on
> a given platform. How else should we test semantics errors otherwise ? The=
re are past
> examples of usefulness for this procedure on arm64 and on s390. I am wonde=
ring how
> else to prove the usefulness of a debug feature if these references are no=
t enough.

Not saying it will not be useful. As you mentioned it actually found a bug o=
r two in the past. The problem is that there is always a cost to maintain so=
mething like this, and nobody knew how things could be broken even for the i=
solated code you mentioned in the future given how complicated the kernel co=
de base is. I am not so positive that many developers would enable this debu=
g feature and use it on a regular basis from the information you gave so far=
.=20

On the other hand, it might just be good at maintaining this thing out of tr=
ee by yourself anyway, because if there isn=E2=80=99t going to be used by ma=
ny developers, few people is going to contribute to this and even noticed wh=
en it is broken. What=E2=80=99s the point of getting this merged apart from b=
eing getting some meaningless credits?=
