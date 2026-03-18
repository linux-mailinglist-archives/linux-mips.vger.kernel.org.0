Return-Path: <linux-mips+bounces-13753-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uB8NIFzNummfcAIAu9opvQ
	(envelope-from <linux-mips+bounces-13753-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 17:05:48 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1252BEF2C
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 17:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 324E1321832F
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 15:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45AF331353C;
	Wed, 18 Mar 2026 15:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AAFfqGYQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B773B3E2741;
	Wed, 18 Mar 2026 15:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849040; cv=none; b=KIdimZDLPM2yskMppGJG+pJGlWYioZTWvxOWPxLsR/9OB4umvUqYXBS3sH4chQW4qp9dT5dIWBxA/jKfds5qMVbo67SEPbD8LTcND/MmEpqFzvSwzWF8MbyCiQGubEKj5pjCHQ9Iu5G8WZYSwjrw12eeZgJSGrgAbNgp9Bq7UC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849040; c=relaxed/simple;
	bh=VbL3vAwO1cMuvFosJZiW6nFGpT2xBVdrJqX0D4K97+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jsebi6c909H3spEHCO6k6opiO3OK419nSjRsNJsdHcDLeMb0DoVvN8J7xgykeH2K6RFL8mQN+8yVoVD+fkiDISIJb3XJ/HVLSG6XnrKM6lMxW8t92CNLE6YKg67phMksv8U76sANuqaP+KIF2egCYolo56BH7ZAomr+oq8waupo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AAFfqGYQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EED9C2BC87;
	Wed, 18 Mar 2026 15:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773849040;
	bh=VbL3vAwO1cMuvFosJZiW6nFGpT2xBVdrJqX0D4K97+Y=;
	h=From:To:Cc:Subject:Date:From;
	b=AAFfqGYQjrNAaikG4d58f7LT11O0f7S5Nbf54jlY2cMK5jf5dEZJLAD13NoXMPC1F
	 vI9adgRokefNTjvg/a7A2EQRndqW1kl15xOJC8eIWSTPTzjKJkYxd7M+KOzeI9qelX
	 qCxQAgiRAKDyyyPqy2LwyNTX1MN/vbMCQQSSNfaQm4Amsz0CXjbCVbQVLMHpQkP/iU
	 xI4mrH9MWarFuuw4lqv/5of3VXlBMa5aK/Jpk6IVOUGlZzqx9UNdMcbL/kr2ZFn/+H
	 LezLJjFgzaMnWnuWNJFP/UqGvxok4yXnBI3n9D1eh1DkFckpRgieaDTJmwyznkcevS
	 R9Vmwjo1EyS/A==
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Kees Cook <kees@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Brian Cain <bcain@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Michal Hocko <mhocko@suse.com>,
	Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	selinux@vger.kernel.org
Subject: [PATCH v3 00/23] mm/vma: convert vm_flags_t to vma_flags_t in vma code
Date: Wed, 18 Mar 2026 15:50:11 +0000
Message-ID: <cover.1773846935.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,google.com,suse.de,kvack.org,vger.kernel.org,armlinux.org.uk,arm.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,nod.at,cambridgegreys.com,sipsolutions.net,zeniv.linux.org.uk,suse.cz,zte.com.cn,linux.dev,suse.com,paul-moore.com,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13753-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_GT_50(0.00)[62];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.962];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Queue-Id: 2A1252BEF2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series converts a lot of the existing use of the legacy vm_flags_t
data type to the new vma_flags_t type which replaces it.

In order to do so it adds a number of additional helpers:

* vma_flags_empty() - Determines whether a vma_flags_t value has no bits
  set.

* vma_flags_and() - Performs a bitwise AND between two vma_flags_t values.

* vma_flags_diff_pair() - Determines which flags are not shared between a
  pair of VMA flags (typically non-constant values)

* append_vma_flags() - Similar to mk_vma_flags(), but allows a vma_flags_t
  value to be specified (typically a constant value) which will be copied
  and appended to to create a new vma_flags_t value, with additional flags
  specified to append to it.

* vma_flags_same() - Determines if a vma_flags_t value is exactly equal to
  a set of VMA flags.

* vma_flags_same_mask() - Determines if a vma_flags_t value is eactly equal
  to another vma_flags_t value (typically constant).

* vma_flags_same_pair() - Determines if a pair of vma_flags_t values are
  exactly equal to one another (typically both non-constant).

* vma_flags_to_legacy() - Converts a vma_flags_t value to a vm_flags_t
  value, used to enable more iterative introduction of the use of
  vma_flags_t.

* legacy_to_vma_flags() - Converts a vm_flags_t value to a vma_flags-t
  value, for the same purpose.

* vma_flags_test_single_mask() - Tests whether a vma_flags_t value contain
  the single flag specified in an input vma_flags_t flag mask, or if that
  flag mask is empty, is defined to return false. Useful for
  config-predicated VMA flag mask defines.

* vma_test() - Tests whether a VMA's flags contain a specific singular VMA
  flag.

* vma_test_any() - Tests whether a VMA's flags contain any of a set of VMA
  flags.

* vma_test_any_mask() - Tests whether a VMA's flags contain any of the
  flags specified in another, typically constant, vma_flags_t value.

* vma_test_single_mask() - Tests whether a VMA's flags contain the single
  flag specified in an input vma_flags_t flag mask, or if that flag mask is
  empty, is defined to return false. Useful for config-predicated VMA flag
  mask defines.

* vma_clear_flags() - Clears a specific set of VMA flags from a vma_flags_t
  value.

* vma_clear_flags_mask() - Clears those flag set in a vma_flags_t value
  (typically constant) from a (typically not constant) vma_flags_t value.

The series mostly focuses on the the VMA specific code, especially that
contained in mm/vma.c and mm/vma.h.

It updates both brk() and mmap() logic to utils vma_flags_t values as much
as is practiaclly possible at this point, changing surrounding logic to be
able to do so.

It also updates the vma_modify_xxx() functions where they interact with VMA
flags directly to use vm_flags_t values where possible.

There is extensive testing added in the VMA userland tests to assert that
all of these new VMA flag functions work correctly.


v3:
* Folded in tags, thanks Paul, Vlastimil!
* Respun to apply the correct suggestions/reports from
  https://sashiko.dev/#/patchset/cover.1773665966.git.ljs%40kernel.org
  (note there is also quite a lot of noise, that is ignored).
* Const-ified vma_flags_t * param for vma_flags_empty() as per Sashiko.
* Obtained sticky flag masks after VMA write lock acquired on merge and
  update vma_expand() similarly. This is meaningful, as the maybe guard
  flag is set atomically which might race outside of a VMA write lock, as
  per Sashiko.
* Dropped comment about 'VM_NONE convenience' from 5/23 commit message as
  the VMA_xxx form flags can now provide that.
* Updated legacy_to_vma_flags() to ensure upper bits are cleared for
  NUM_VMA_FLAG_BITS > 64 as per Sashiko.
* Updated legacy_to_vma_flags() to use vma_flags_overwrite_word() for
  consistency.
* Refreshed vma_flags_overwrite_word(), vma_flag_overwrite_word_once(),
  vma_flags_set_word() and vma_flags_clear_word() in the VMA test dup.h
  header to keep them consistent with the kernel.
* Updated VMA_DATA_DEFAULT_FLAGS declaration on arm64 to be predicated on
  CONFIG_ARM64_MTE as to whether VMA_MTE_ALLOWED_BIT is set, as per
  Sashiko.
* Fixed bug where the VMA did not have VMA_SOFTDIRTY_BIT set if
  pgtable_supports_soft_dirty(), but rather the stack variable vma_flags,
  as per Sashiko.
* Corrected vmag -> vma typo in VMA test code as per Sashiko.
* Fixed typo in 20/23 commit message 'correctly' -> 'correct' as per
  Sashiko.
* Fixed VMA flag clear tests to consistently do vma_clear_flags_mask(&vma,
  mask) rather than vma_flags_clear_mask(&vma.flags, mask) as per Sashiko.
* Added missing vma_start_write() in mseal_apply() as per Sahiko.

v2:
* Rebased on mm-unstable.
* Added vma_flags_count() and vma[_flags]_test_single_mask() for testing
  whether flags have a single flag set depending on an input flag mask,
  returning false if the flag mask is empty.
* Added tests for vma_flags_count() and vma[_flags]_test_single_mask().
* Updated the KSM VMA_DROPPABLE test to use vma_flags_test_single_mask().
* Updated the newly-introduced-since-rebase vma_supports_mlock() to use
  vma_flags_t.
https://lore.kernel.org/linux-mm/cover.1773665966.git.ljs@kernel.org/

v1:
https://lore.kernel.org/linux-mm/cover.1773342102.git.ljs@kernel.org/


Lorenzo Stoakes (Oracle) (23):
  mm/vma: add vma_flags_empty(), vma_flags_and(), vma_flags_diff_pair()
  tools/testing/vma: add unit tests flag empty, diff_pair, and[_mask]
  mm/vma: add further vma_flags_t unions
  tools/testing/vma: convert bulk of test code to vma_flags_t
  mm/vma: use new VMA flags for sticky flags logic
  tools/testing/vma: fix VMA flag tests
  mm/vma: add append_vma_flags() helper
  tools/testing/vma: add simple test for append_vma_flags()
  mm: unexport vm_brk_flags() and eliminate vm_flags parameter
  mm/vma: introduce vma_flags_same[_mask/_pair]()
  mm/vma: introduce [vma_flags,legacy]_to_[legacy,vma_flags]() helpers
  tools/testing/vma: test that legacy flag helpers work correctly
  mm/vma: introduce vma_test[_any[_mask]](), and make inlining
    consistent
  tools/testing/vma: update VMA flag tests to test vma_test[_any_mask]()
  mm: introduce vma_flags_count() and vma[_flags]_test_single_mask()
  tools/testing/vma: test vma_flags_count,vma[_flags]_test_single_mask
  mm: convert do_brk_flags() to use vma_flags_t
  mm: update vma_supports_mlock() to use new VMA flags
  mm/vma: introduce vma_clear_flags[_mask]()
  tools/testing/vma: update VMA tests to test vma_clear_flags[_mask]()
  mm/vma: convert as much as we can in mm/vma.c to vma_flags_t
  mm/vma: convert vma_modify_flags[_uffd]() to use vma_flags_t
  mm/vma: convert __mmap_region() to use vma_flags_t

 arch/arc/include/asm/page.h        |   2 +-
 arch/arm/include/asm/page.h        |   2 +-
 arch/arm64/include/asm/page.h      |   7 +-
 arch/hexagon/include/asm/page.h    |   2 +-
 arch/loongarch/include/asm/page.h  |   2 +-
 arch/mips/include/asm/page.h       |   2 +-
 arch/nios2/include/asm/page.h      |   2 +-
 arch/powerpc/include/asm/page.h    |   4 +-
 arch/powerpc/include/asm/page_32.h |   2 +-
 arch/powerpc/include/asm/page_64.h |  12 +-
 arch/riscv/include/asm/page.h      |   2 +-
 arch/s390/include/asm/page.h       |   2 +-
 arch/x86/include/asm/page_types.h  |   2 +-
 arch/x86/um/asm/vm-flags.h         |   4 +-
 fs/binfmt_elf.c                    |   3 +-
 include/linux/ksm.h                |  10 +-
 include/linux/mm.h                 | 328 ++++++++++++++++++++------
 include/linux/mm_types.h           |  52 ++++-
 include/linux/mman.h               |  49 ----
 include/linux/userfaultfd_k.h      |   3 +
 mm/internal.h                      |   7 +-
 mm/ksm.c                           |  43 ++--
 mm/madvise.c                       |  10 +-
 mm/mlock.c                         |  38 +--
 mm/mmap.c                          |  19 +-
 mm/mprotect.c                      |  53 +++--
 mm/mremap.c                        |   6 +-
 mm/mseal.c                         |  11 +-
 mm/userfaultfd.c                   |  21 +-
 mm/vma.c                           | 211 ++++++++++-------
 mm/vma.h                           |  86 ++++++-
 mm/vma_exec.c                      |   5 +-
 security/selinux/hooks.c           |   4 +-
 tools/include/linux/bitmap.h       |  13 ++
 tools/lib/bitmap.c                 |  10 +
 tools/testing/vma/include/custom.h |  25 --
 tools/testing/vma/include/dup.h    | 287 +++++++++++++++++------
 tools/testing/vma/include/stubs.h  |  11 +-
 tools/testing/vma/shared.c         |   8 +-
 tools/testing/vma/shared.h         |  22 +-
 tools/testing/vma/tests/merge.c    | 311 +++++++++++++------------
 tools/testing/vma/tests/mmap.c     |  18 +-
 tools/testing/vma/tests/vma.c      | 359 +++++++++++++++++++++++++----
 tools/testing/vma/vma_internal.h   |   6 +
 44 files changed, 1435 insertions(+), 641 deletions(-)

--
2.53.0

