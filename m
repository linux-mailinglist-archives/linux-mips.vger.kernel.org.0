Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66CF714B00D
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2020 08:07:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbgA1HHK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jan 2020 02:07:10 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:44201 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbgA1HHK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Jan 2020 02:07:10 -0500
Received: by mail-qt1-f193.google.com with SMTP id w8so9483886qts.11
        for <linux-mips@vger.kernel.org>; Mon, 27 Jan 2020 23:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=S88X9kdR1m457FxjowRY1cG95Ez9+awfEFeNZBzBj5c=;
        b=HLqlIR1y5B5/PsLNv/5LbKmkRD0LOfvs+3Uw5UFR8XmB3CZjk35sCKEGU7QUrB0DXx
         ro3J8jPDeF5kpX6rK5bqvFjVyygmmBxTqc+U9+GqB6XkJi7vq8NcYRCERMAEMhDVXUCh
         582xGO5f2XyXtpU5uRDgb4Bc99IiX0ZDjMomKpIHbbLRjRqqVt+qwAOuBjm+lP5W2SJ+
         vCTV/46saWz+DSrfHpwXbiE5Bw1kdqVnfBTP+u5/moAx6Z3f1YyRVCqjbBB5F8ReCJuz
         rLNiGsK+2jKaexspyfqYWjO7Gf6gMQ5SLYW8N1k3kz0BSFSsLmhau83aEBKEGep3vOtX
         Tp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=S88X9kdR1m457FxjowRY1cG95Ez9+awfEFeNZBzBj5c=;
        b=F4A9nB87PquHFgYelA40Oa37q3gU6IyIAxpLeaCgsy8RjrvHSXkU2uGhj0wMs8wMQm
         0qOdgLIXeSicGCxAukvMQvDzT/hMQE1Y0pqhnPmLzg9/TiCiD+KP4ngJy0qOh6HdKaST
         GRqnXTcs0q2qJUk+Yj0EiayZKvJBaosbzk8vW9OGl7Ti4VMCgxY9YLxPuCYw9KJ6ltLB
         iliBpHynZjZQS78633qsvv/4GyERRQjCN3rsy+sC9N9KaFErEQUkFhBClt/jDVadnY1o
         byKBqxNWjpKX1kv8wcRN4tWawjlv5TjoRE27C1lO8jyR5AlLsSWCE/Sb2LVKX8i01ZcC
         u/Gg==
X-Gm-Message-State: APjAAAUlQ56ahx47G9uMniXs/v6tZCQ+BJfthDc3+guvdGSHPMvU0rx8
        QUu1ytSBHdAUB+Y0e4W5cU1teA==
X-Google-Smtp-Source: APXvYqwjL/tF2WR3QmLuG8LOj7E2zvaXqRI6bLl13yd8OQ3r0ofRKuuNBE3aHo9M+hTpUmSXvKe5+w==
X-Received: by 2002:aed:3fce:: with SMTP id w14mr20841113qth.0.1580195228489;
        Mon, 27 Jan 2020 23:07:08 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id q130sm11341027qka.114.2020.01.27.23.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 23:07:07 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page table helpers
Date:   Tue, 28 Jan 2020 02:07:07 -0500
Message-Id: <C0CC7DB9-5B58-40D3-BE7A-D15B3738C971@lca.pw>
References: <ba5a836a-b594-f846-1734-71dcd5d089e6@arm.com>
Cc:     Christophe Leroy <christophe.leroy@c-s.fr>,
        Linux-MM <linux-mm@kvack.org>,
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
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <ba5a836a-b594-f846-1734-71dcd5d089e6@arm.com>
To:     Anshuman Khandual <Anshuman.Khandual@arm.com>
X-Mailer: iPhone Mail (17C54)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> On Jan 28, 2020, at 2:03 AM, Anshuman Khandual <Anshuman.Khandual@arm.com>=
 wrote:
>=20
> 'allyesconfig' makes 'DEBUG_VM =3D y' which in turn will enable 'DEBUG_VM_=
PGTABLE =3D y'
> on platforms that subscribe ARCH_HAS_DEBUG_VM_PGTABLE.

Isn=E2=80=99t that only for compiling testing? Who is booting such a beast a=
nd make sure everything working as expected?=
