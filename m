Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 679DD1599AC
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2020 20:24:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729770AbgBKTYs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Feb 2020 14:24:48 -0500
Received: from alln-iport-6.cisco.com ([173.37.142.93]:38144 "EHLO
        alln-iport-6.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729586AbgBKTYr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Feb 2020 14:24:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=951; q=dns/txt; s=iport;
  t=1581449087; x=1582658687;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=S4HEuedO9+25hzESHq6yr9Cl6XUXPj8Ik00xGUFYRvA=;
  b=doEVsDqGilEoE3znhVYtIq2HohW2vPXYNCEz97KQ1teDce8FzskKLs+7
   PFMYSGohkYztyumYo66nXXtnHCFTT7jMGqFI2svgMPoA7l5/flIiZ2Cc2
   FYJGvBMGgIouN9IS4k7fUbI9N4+aJRBAI5VPNKLeX0xRpqXXZSEnffvpM
   M=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BZAAAJ/0Je/49dJa1mHAEBAQEBBwE?=
 =?us-ascii?q?BEQEEBAEBgWkFAQELAYIobFUyKq5/gXsJAQEBDAEBJQoBAYRAgkkkNgcOAgM?=
 =?us-ascii?q?NAQEEAQEBAgEFBG2FNwyGHwFGgT4BEoMmAYJ7D6sngieENQGGAwaBOAGHRIR?=
 =?us-ascii?q?eGoIAg29zhBKGJwSNUIo4l2qCRIJOhH6OdAwbmw+OZIhskjkCBAYFAhWBWQU?=
 =?us-ascii?q?tgVhNIxWDJxM9GA2XJIVgIAMwAgGMIoJDAQE?=
X-IronPort-AV: E=Sophos;i="5.70,428,1574121600"; 
   d="scan'208";a="448978575"
Received: from rcdn-core-7.cisco.com ([173.37.93.143])
  by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 11 Feb 2020 19:24:46 +0000
Received: from kamensky-p53s.cisco.com ([10.24.40.152])
        (authenticated bits=0)
        by rcdn-core-7.cisco.com (8.15.2/8.15.2) with ESMTPSA id 01BJObLT004796
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 11 Feb 2020 19:24:46 GMT
From:   Victor Kamensky <kamensky@cisco.com>
To:     linux-mips@vger.kernel.org, Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        bruce.ashfield@gmail.com, richard.purdie@linuxfoundation.org
Subject: [PATCH v2 0/2] mips: vdso: fix 'jalr t9' crash in vdso code
Date:   Tue, 11 Feb 2020 11:24:32 -0800
Message-Id: <20200211192434.24871-1-kamensky@cisco.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-User: kamensky@cisco.com
X-Outbound-SMTP-Client: 10.24.40.152, [10.24.40.152]
X-Outbound-Node: rcdn-core-7.cisco.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul and all,

Here is the second version of patch set dealing with 'jalr t9'
crash in vdso code. Root cause and investigation details could be
found in first version cover letter for this patch series [1].

Changes in v2:
   - added -mrelax-pic-calls -mexplicit-relocs unconditionally
     (dropped 'call cc-option') since minimal supported gcc version
     already has them
   - fixed few misspellings in commit messages
   - added explanation in commit messages about handling static
     functions PIC calls through mips local GOT and absence of dynamic
     relocations in this case

Thanks,
Victor

[1] https://lore.kernel.org/linux-mips/20200203233133.38613-1-kamensky@cisco.com

Victor Kamensky (2):
  mips: vdso: fix 'jalr t9' crash in vdso code
  mips: vdso: add build time check that no 'jalr t9' calls left

 arch/mips/vdso/Makefile | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
2.24.1

