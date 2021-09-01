Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B101F3FE33A
	for <lists+linux-mips@lfdr.de>; Wed,  1 Sep 2021 21:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344371AbhIATnO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 Sep 2021 15:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344059AbhIATnO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 1 Sep 2021 15:43:14 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 263D4C061764
        for <linux-mips@vger.kernel.org>; Wed,  1 Sep 2021 12:42:17 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id q3so318248plx.4
        for <linux-mips@vger.kernel.org>; Wed, 01 Sep 2021 12:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ebtoOBcpDUULZo3w3apLL5azNq/Rs8U/WDJ70Gxq2+c=;
        b=Cuw3iP3DHe4ruWxDUmqDdGVO9qUUiZh8jVAyKGsUJVKZ9zKPp1+3QV0L0cZVgtw5Ti
         yJOoq9MicxKV1CkQQUJp4XaX5J0NQXrj6D8jX5M9y974nMxxTeo08nficzoeekMUDfWq
         ygLCILeTd6AxvyVE2nHr9hwj/pnKah987/SJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ebtoOBcpDUULZo3w3apLL5azNq/Rs8U/WDJ70Gxq2+c=;
        b=OiLlHJtxXcecHZi2SnhvSHRmr1V4ut9UYcjNv9xL/f+3F1LdrCzzLFnHv/ML05B7V3
         fBefml0xcM1TXhdSz1ks9R9rbYexQiUt+9PBBeEw2WVzYIsbU4os2WQTHTIHZQvqb5LY
         z7Y/oVrojiHf3BdvpVbkpRPjqCwGRxEPyBrnJDZNQ0Oz4CiUXZN+nZPLmMCE5sdctMZm
         oeVBHE3VvIcsX0zF0bTzReGF2sxjx8AhgVNqOn2IJxvFqPvacl8Dxa/V6AsVBZqytFII
         BnCF/3NQrwJN0L0u+VPEGWT0IO9iemqWjTsoWNAeUR8V7vZVlKJs9hE/Z4IWjGTWhtch
         tq5w==
X-Gm-Message-State: AOAM531NoW2ooTwQoGm30DNRe6azk+Nsz6BipNufC79QpFGzxYrfNLUn
        ea/MFAGTsRM5xzYILHF2Bg+xlQ==
X-Google-Smtp-Source: ABdhPJxU+RdXvQh/l+SUjFFDn8PuEsKOiw0nZnztwkQ4vrsEm73j9Im+WTeCH6buWNcBduvbhXcjRw==
X-Received: by 2002:a17:90b:1c05:: with SMTP id oc5mr1033960pjb.209.1630525336556;
        Wed, 01 Sep 2021 12:42:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u22sm258609pfi.143.2021.09.01.12.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 12:42:15 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Kees Cook <keescook@chromium.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>, linux-mips@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        linux-hardening@vger.kernel.org
Subject: [PATCH] MIPS: Modernize READ_IMPLIES_EXEC
Date:   Wed,  1 Sep 2021 12:42:08 -0700
Message-Id: <20210901194208.2420671-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3951; h=from:subject; bh=JgSNdSTf0XI8ictb5n4zr8brlJGAtynBafE+8Az2YUY=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhL9eQd35WWsTd5cvtgscZgyjbIm3VRtVTBF2bLKo/ idf6BhCJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYS/XkAAKCRCJcvTf3G3AJgRtD/ 95cGzPJCdT2cbu2jeqL0Seg/TOzhe14oYZKcUtz2T0YKt/ZRNjvdnDIlbTgzWznrX30dfbHUdM6M4Q gRVkf18wD1diiVsnlFjIp4e5h5Zi98AkxsU3HsAEqX7ke1oBSKXmBNYrD+nFKdC7fQJCocGsQhhv7y pY+aox1wZkJcXxlms0BlkfMk2aBj3m8hbcAGJjrBtdWnVZ03L2OICWTo3o2y+AHbbtOr+xPSXI/Dn+ EdJzsqwJWR5WXJYH51KaOWwS0DsidIX1EmlBlxRlXHxgrXAI9OvNSlWEikOAMKMxIvdjvLk+ZVkj2B /gtn9H53cgoMZQSm5RelszQuullmt+HoFPUkpItBhIpb9Y3UcAc2jaDhoFjsy+jh7+FBd9IznLOU6q HjHRYOy3zTgUFsK/gSVej/8DPVRPPUElvtSuNYnmXzF2Q5tpP6JP3kClPQV49fDEIhsRPx2E/8VBt4 FisfBUD0J+xhyOoMdUTwm4Yt5BXEcT/P5xjNl3Avfng38iJ+P8+9h4+V8HYhffYT+dwBDTmOr/JIb7 6tm5w246Np6NVxfWaFvxihKiKyQU8kvDeyGp+dkiFzEyvrs4LPKOusO++PI/iSFCUQAPYpP9Q3i5VA 9qmw+deIu1AMnT8gX/6O3C20biTY8RDZzr+u8YdUF8tx2QK/Fdw5aT/Xfa6Q==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

I'm doing some thread necromancy of
https://lore.kernel.org/lkml/202007081624.82FA0CC1EA@keescook/

x86, arm64, and arm32 adjusted their READ_IMPLIES_EXEC logic to better
align with the safer defaults and the interactions with other mappings,
which I illustrated with this comment on x86:

/*
 * An executable for which elf_read_implies_exec() returns TRUE will
 * have the READ_IMPLIES_EXEC personality flag set automatically.
 *
 * The decision process for determining the results are:
 *
 *                 CPU: | lacks NX*  | has NX, ia32     | has NX, x86_64 |
 * ELF:                 |            |                  |                |
 * ---------------------|------------|------------------|----------------|
 * missing PT_GNU_STACK | exec-all   | exec-all         | exec-none      |
 * PT_GNU_STACK == RWX  | exec-stack | exec-stack       | exec-stack     |
 * PT_GNU_STACK == RW   | exec-none  | exec-none        | exec-none      |
 *
 *  exec-all  : all PROT_READ user mappings are executable, except when
 *              backed by files on a noexec-filesystem.
 *  exec-none : only PROT_EXEC user mappings are executable.
 *  exec-stack: only the stack and PROT_EXEC user mappings are
 *  executable.
 *
 *  *this column has no architectural effect: NX markings are ignored by
 *   hardware, but may have behavioral effects when "wants X" collides with
 *   "cannot be X" constraints in memory permission flags, as in
 *   https://lkml.kernel.org/r/20190418055759.GA3155@mellanox.com
 *
 */

For MIPS, the "lacks NX" above is the "!cpu_has_rixi" check. On x86,
we decided that the READ_IMPLIES_EXEC flag needed to reflect the
expectations, not the architectural behavior due to bad interactions
as noted above, as always returning "1" on non-NX hardware breaks
some mappings.

The other part of the issue is "what does the MIPS toolchain do for
PT_GNU_STACK?" The answer seems to be "by default, include PT_GNU_STACK,
but mark it executable" (likely due to concerns over non-NX hardware):

$ mipsel-linux-gnu-gcc -o hello_world hello_world.c
$ llvm-readelf -lW hellow_world | grep GNU_STACK
  GNU_STACK      0x000000 0x00000000 0x00000000 0x00000 0x00000 RWE 0x10

Given that older hardware doesn't support non-executable memory, it
seems safe to make the "PT_GNU_STACK is absent" logic mean "assume
non-executable", but this might break very old software running on
modern MIPS. This situation matches the ia32-on-x86_64 logic x86
uses (which assumes needing READ_IMPLIES_EXEC in that situation). But
modern toolchains on modern MIPS hardware should follow a safer default
(assume NX stack).

A follow-up to this change would be to switch the MIPS toolchain to emit
a non-executable PT_GNU_STACK, as this seems to be unneeded.

Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Xuefeng Li <lixuefeng@loongson.cn>
Cc: Juxin Gao <gaojuxin@loongson.cn>
Cc: linux-mips@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/mips/kernel/elf.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/mips/kernel/elf.c b/arch/mips/kernel/elf.c
index 7b045d2a0b51..5582a4ca1e9e 100644
--- a/arch/mips/kernel/elf.c
+++ b/arch/mips/kernel/elf.c
@@ -328,16 +328,10 @@ void mips_set_personality_nan(struct arch_elf_state *state)
 
 int mips_elf_read_implies_exec(void *elf_ex, int exstack)
 {
-	if (exstack != EXSTACK_DISABLE_X) {
-		/* The binary doesn't request a non-executable stack */
-		return 1;
-	}
-
-	if (!cpu_has_rixi) {
-		/* The CPU doesn't support non-executable memory */
-		return 1;
-	}
-
-	return 0;
+	/*
+	 * Set READ_IMPLIES_EXEC only on non-NX systems that
+	 * do not request a specific state via PT_GNU_STACK.
+	 */
+	return (!cpu_has_rixi && exstack == EXSTACK_DEFAULT);
 }
 EXPORT_SYMBOL(mips_elf_read_implies_exec);
-- 
2.30.2

