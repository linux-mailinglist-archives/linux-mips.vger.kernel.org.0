Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8601A14B427
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2020 13:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbgA1MaQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jan 2020 07:30:16 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:34246 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgA1MaQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Jan 2020 07:30:16 -0500
Received: by mail-qk1-f195.google.com with SMTP id d10so13134294qke.1
        for <linux-mips@vger.kernel.org>; Tue, 28 Jan 2020 04:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:date:subject:message-id
         :cc:to;
        bh=8GwDVchQDE0RRDd6Z1x4gzFv6pXtLF378PeW6dBbf+w=;
        b=Rbz1P8X1bfckF8p5+fQPfltDNpYpc5sp5fHqq9u1T5/uhK6rRW78SfwJEw2v28znfV
         wPfmUeOnrz7CBbeIgQixtLq2TPQmdgtO1vVi6z9urV65HN1x4ZK0nWUORD8codoMVkS8
         rPApC12IYdkgP3grHEjFihd/Jh4OgeLy2QqFihiQOoNERJPGlH4ggjAY8evnQXoqrTaN
         KqoP6/pkU7BjH0xE18gbhqENWpt3g5gz/4WQxHhB9FaTgVokGRGk0m2PJgFNbLse/V1Q
         DUm5C86KbFXNmme7COzfebOm4aubFGvujqheNY2AxjxXyz7y4nv8h1Ou8ChS1lBEdbUk
         SJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version:date
         :subject:message-id:cc:to;
        bh=8GwDVchQDE0RRDd6Z1x4gzFv6pXtLF378PeW6dBbf+w=;
        b=otlvORtXklCwoCVQAGDM7Xlb91VU+Vg5ErgfQiWYhBXWubtOV/caR1LErPugu2RU3a
         IfEjVtnyxKv0/MH3u6BBW+pWd7YzY6yNFCYZD/O4PUNQn7Jni8e+9O8caGYp7gp/iDzT
         hStR813/7KCxiesHhFii+cYJZr8DMSVSJYV5TQXOcNVk8CQ12HrbhMNTMdOlvDA4iR9U
         sWWMC6VOHLZEw4qJGXH2XK2ZV8roYXjZmG+fWYxAZp4/ITtiDgQKrOOEu3RBOY59iQDV
         la2Wf9Z3ZJhPXpSojVthUOBJI69FZCCJ+ZZ8D00opJaDB9ley+rdwHPcfPf4P+4eSOzQ
         paPw==
X-Gm-Message-State: APjAAAU6qdwraAub4gYD3U57TK8f+5H63RIbzNfJLNMzv8SkT7Rq0cDD
        ValA4bNfKA3sMKtnslH2vEoV+g==
X-Google-Smtp-Source: APXvYqw4NHHH616JlS/IrWEyv4wSaDB7EoG4ap5GXk6Z++ZZIlsdVUcHztpJPWJHmyylARL29R+hpQ==
X-Received: by 2002:a37:9ce:: with SMTP id 197mr22314564qkj.194.1580214614838;
        Tue, 28 Jan 2020 04:30:14 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id 69sm11862264qkk.106.2020.01.28.04.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2020 04:30:14 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Date:   Tue, 28 Jan 2020 07:30:13 -0500
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page table helpers
Message-Id: <0C97A195-CBF2-43EF-88A0-7683BB9EF892@lca.pw>
Cc:     Anshuman Khandual <Anshuman.Khandual@arm.com>,
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
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
To:     Mike Rapoport <rppt@linux.ibm.com>
X-Mailer: iPhone Mail (17C54)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> On Jan 28, 2020, at 7:10 AM, Mike Rapoport <rppt@linux.ibm.com> wrote:
>=20
> Aren't x86 and arm64 not decent enough?
> Even if this test could be used to detect regressions only on these two
> platforms, the test is valuable.

The question is does it detect regressions good enough? Where is the list of=
 past bugs that it had found?

It is an usual deal for unproven debugging features remain out of tree first=
 and keep gathering unique bugs it found and then justify for a mainline inc=
lusion with enough data.=
