Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA9814B01A
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2020 08:13:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbgA1HM7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jan 2020 02:12:59 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:34262 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbgA1HM7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Jan 2020 02:12:59 -0500
Received: by mail-qt1-f194.google.com with SMTP id h12so9525989qtu.1
        for <linux-mips@vger.kernel.org>; Mon, 27 Jan 2020 23:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=qKA4UjioXFc27zR8c2yU7DKOhu3nMjpZIq48GcXCB6g=;
        b=RmoEayVYUYqFJblJjIh2uN7kKQmME+y9qMPPUAS2F75g/qPxCehTcmMRH2ge8tD4CC
         GQDWfmy38oVlt13IpEPzfTJGsLQXsq1gDyu3NoJNll2CaNkYdTxXz7pUJN2PlgBCQkzr
         ixOQcgD/jWefyEStVZYEzc+BSTXwnZwklPhwdX/B6Cbrc4l/QVK10xPmQO0Qt6VvxdQT
         ziJY9PgEd6H2+XCfOzRdETkAmZErEBWCkltXcleoXo/oHCehLwvLLErnxEW4xJx6a/0a
         igVVZvv1THX9+TtCIsBpUqBjFmoq8tgeHQDzVMftknmCDfuDqnXoun4BF19nE9j/tt4x
         rjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=qKA4UjioXFc27zR8c2yU7DKOhu3nMjpZIq48GcXCB6g=;
        b=l4l8gVrg2QxZpYg78LXSBbc2yZxlGUV2peAA+HSUFIFWJ/wqmYjJCuDklzrhGtx5dl
         1S6I2LSOeYweIAtI4ctN6yhjBHIvev4+Su1aqhOE/Qef+yhs/TdRSL8Ux3IBubzsNGpf
         CEFLYllOP19vNaJWhKbRSAM8keuQwHFGJFw6/ap8R3RZKzXZhIFqmpkGFri02EmrK3po
         EwuTINukX4G9ev5qckc9Lstm6Veac1a8rYwntzFXppR8g3t/xlIrfQD3oCJ5DWxlXh0+
         GAabamycqM79cZcpTob/r3CyuPWW5YLh+4GItvTwB2+6ULBEI0jbgXrtH0C7vxdRhgej
         UZQQ==
X-Gm-Message-State: APjAAAXeDDmAWC9c1v0Wx12wNj43/J5cYKK7wHATVFlHdn0rO5YC5bkr
        HWtj4dRdvNY1zSKRg0Qy5gsy6A==
X-Google-Smtp-Source: APXvYqxXDFn+55Cbaf2UqBVqTFuREFEorSGuAtTGsaQy+PPAoTQF0xb8VLQhlT+h7JaiQcuNWDyViw==
X-Received: by 2002:aed:3109:: with SMTP id 9mr20529841qtg.166.1580195577905;
        Mon, 27 Jan 2020 23:12:57 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id z8sm11967722qth.16.2020.01.27.23.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 23:12:57 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From:   Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page table helpers
Date:   Tue, 28 Jan 2020 02:12:56 -0500
Message-Id: <144F3894-7934-4EC7-A9F9-C6A84CA08C65@lca.pw>
References: <a7ba6d8a-6443-5994-6a34-2824aa9b054b@c-s.fr>
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
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <a7ba6d8a-6443-5994-6a34-2824aa9b054b@c-s.fr>
To:     Christophe Leroy <christophe.leroy@c-s.fr>
X-Mailer: iPhone Mail (17C54)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> On Jan 28, 2020, at 1:13 AM, Christophe Leroy <christophe.leroy@c-s.fr> wr=
ote:
>=20
> ppc32 an indecent / legacy platform ? Are you kidying ?
>=20
> Powerquicc II PRO for instance is fully supported by the manufacturer and w=
idely used in many small networking devices.

Of course I forgot about embedded devices. The problem is that how many deve=
lopers are actually going to run this debug option on embedded devices?=
