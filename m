Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3532B1BCF95
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 00:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbgD1WOk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Apr 2020 18:14:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726256AbgD1WOk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Apr 2020 18:14:40 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24953C03C1AC;
        Tue, 28 Apr 2020 15:14:40 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id r66so4586179oie.5;
        Tue, 28 Apr 2020 15:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gw3ps5zK5zSBmyFNg+4aZWNwqGcQxCszeQ7AAe08xO4=;
        b=L6F2pSLPacUX4g7U4s6bRzuld1CoTBW3Ns51VdsVOAEJZ9rQ9425HNqX1kytVKz5To
         nuzMdNnvjpGEfifWSKGwOsbeAA/0BJhyXUZey8iaKZggTpm2qqVunJO573wpy2f/wMTd
         9cYXLtvujxctil4qXyMAPh09sQq3oytorEZ7F2LSiTYN/469GcXS1PTskBUkwjO6n0rH
         W2hSGZAV3xjEwTmg0MoYFQyYUfTJuvjtznnA1ryRsPnDYENeL2RYMzHbYFXEstbGw+s9
         0dLUB6C26kQE8W7xq9LlxLWb6EXKqpaRqI15eHsXRR/Jp++gWJYXCj/Sd+P0Cuvn917c
         s3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gw3ps5zK5zSBmyFNg+4aZWNwqGcQxCszeQ7AAe08xO4=;
        b=rGiIqxaMm1IX+DQ6IgzP4YjZT9yVeNePrKNgwG+wFbrfE45csNhupBgAynCns9HRVY
         gxw7KAPOP2lPpptcBoXM9NFaeLnv+vZu/GySW4BFTZj04aVForSClukAy51YbinNqMHY
         uv4ylm7LlmZibyzhJGU1voWyiu6FePhM/SGbiaR9R4ZxaN/rCYDOCAYC3gvGnklIzQrr
         66gGnLJ8DZb8UpOGGutnzMzXKuq1yC0Evz/VEMBkro7x7GHEVzJgUh0gMDO/Uj1OqOlN
         pHKH9Yenaf+/6jbD7HjIreojs5TlErjbrsmx1LzfX/98ItlUmIW9MLqkHy1z0V6SVGqE
         gy3Q==
X-Gm-Message-State: AGi0PubiekXwILRNjK0hhzHUIQLJt4PTs8vyAxfuzGw425fp6rMtM8Jt
        O/kIO2GQp3Y5bsAF486tiz4=
X-Google-Smtp-Source: APiQypJOnY6xzEk2rpHlRPmZ6OxrjFYXKeipZIv5+JdWRu9Qnm8bSt8qkw8qqy1zQIg1YXY38o5/sg==
X-Received: by 2002:aca:cdd3:: with SMTP id d202mr4448886oig.162.1588112079435;
        Tue, 28 Apr 2020 15:14:39 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id 186sm5267476ooi.30.2020.04.28.15.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 15:14:38 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Fangrui Song <maskray@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: [PATCH v5 0/5] Allow ld.lld to link the MIPS VDSO
Date:   Tue, 28 Apr 2020 15:14:14 -0700
Message-Id: <20200428221419.2530697-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200423171807.29713-1-natechancellor@gmail.com>
References: <20200423171807.29713-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

This series allows ld.lld to properly and completely link the MIPS vDSO.

Patch 1 adds ld.lld support to Kconfig so that we can avoid certain
ld.bfd checks.

Patch 2 moves disabling of the VDSO to Kconfig. This allows us to avoid
a warning with LD=ld.lld during the clean phase, when we do not have
access to CONFIG_LD_IS_LLD.

Patch 3 prepares for the shift from $(CC) to $(LD) and is probably a
worthwhile change aside from this series because GCC 4.6 is the minimum
version allowed to build the kernel.

Patch 4 does the actual shift from $(CC) to $(LD) to link the VDSO.

Patch 5 allows LD=ld.lld to build the VDSO fully through Kconfig.

I have build tested 32r2_defconfig, 32r2el_defconfig, 64r2_defconfig,
and 64r2el_defconfig with GCC and 32r2el_defconfig and
malta_kvm_guest_defconfig with clang. There is a separate issue with the
64-bit configs (https://github.com/ClangBuiltLinux/linux/issues/884) and
ld.lld does not support the triple OUTPUT_FORMAT linker script macro so
32r2_defconfig errors out in a manner similar to GCC without patch 3:
https://github.com/llvm/llvm-project/blob/46a75436f811d0e6a2c76c669140a7e9471cd2a3/lld/ELF/ScriptParser.cpp#L430
TODO: File an LLVM bug upstream

Please let me know if there are any issues!

Cheers,
Nathan


