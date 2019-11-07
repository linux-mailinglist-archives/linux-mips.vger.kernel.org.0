Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90311F3488
	for <lists+linux-mips@lfdr.de>; Thu,  7 Nov 2019 17:21:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727606AbfKGQVQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Nov 2019 11:21:16 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.163]:24313 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfKGQVQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 Nov 2019 11:21:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1573143674;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:Cc:Message-Id:Date:Subject:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=aqh69ZpwbknWjspEM6G9Ca5ewR6/JGDgYvtTvN080Q8=;
        b=n10pg8/SoywzLtkqHR99QF8OmWLRAxyDLCFTbWSs0ExQ87LkKQpGeuGa0jQI6YlLCj
        RT6tDjvRDr8UZYvo31kRiN6IsP9Gq4sdY0AuB58jbi4/j9bvFwAcuqD/WPi3XWqCxTjN
        2IZ3ZRdujxyjov4EfoXMH6HYpEdjmKGziXf8d5za04nDat8odLHMZ4E64aAQ+aaAxMNg
        1yt9NnRhFCKdNDhgeakfcZlT6caOpgcjnwo3vwr3B7LftIun1MRJnp3YiitCKGkR3qs/
        vbSICsOBpXK65HTlyM+1Y2fIFssQa5zJK3gWqLZZKoHsUc0wb7r7fR5x2J+RSlZA/6EQ
        Ir+A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PrwDCq1eY="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
        with ESMTPSA id L09db3vA7GLDfpN
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Thu, 7 Nov 2019 17:21:13 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: MIPS: bug: gettimeofday syscall broken on CI20 board?
Date:   Thu, 7 Nov 2019 17:21:13 +0100
Message-Id: <18788C50-F29B-4BD7-89F6-B056FF490214@goldelico.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        MIPS Creator CI20 Development 
        <mips-creator-ci20-dev@googlegroups.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,
I am trying to run v5.4-rc6 on the CI20 board (jz4780) and it
is almost ok. Except one strange thing.

If I install a v4.19.81 kernel I can initialize the
ethernet interface and dhclient works.

If I install a v5.4-rc6 kernel on exactly the same
rootfs dhclient fails with

root@letux:~# dhclient
../../../../lib/isc/unix/time.c:200: Operation not permitted
root@letux:~#

I have done some strace and the first significant difference
is that with v5.4-rc6 there is no gettimeofday syscall.

Another symptom pointing in the same direction is that
after manually assigning an IP address I can run ping
but get strange time values.

So it may be that

24640f233b46 mips: Add support for generic vDSO

did break gettimeofday when used with latest Debian Stretch
libraries. I tried to git revert but there are conflicts.

Just a side-note: both kernels work with Debian Jessie,
which likely has an older gettimeofday wrapper that
is not influenced by some subtle change.

BR and thanks,
Nikolaus Schaller

