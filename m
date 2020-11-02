Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E98FC2A227C
	for <lists+linux-mips@lfdr.de>; Mon,  2 Nov 2020 01:02:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbgKBACD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Nov 2020 19:02:03 -0500
Received: from relaygw2-20.mclink.it ([195.78.211.234]:34880 "EHLO
        relaygw2-20.mclink.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727309AbgKBACD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Nov 2020 19:02:03 -0500
Received: from cgp-esgout01-rm.mail.irds.it ([172.24.30.44] verified)
  by relaygw2-20.mclink.it (CommuniGate Pro SMTP 6.0.4)
  with ESMTPS id 182266446 for linux-mips@vger.kernel.org; Mon, 02 Nov 2020 01:02:00 +0100
X-Envelope-From: <mc5686@mclink.it>
Received: from [192.168.7.128] (host-87-16-231-187.retail.telecomitalia.it [87.16.231.187])
        (Authenticated sender: mc5686)
        by cgp-esgout01-rm.mail.irds.it (Postfix) with ESMTPA id 9C3FA41AF9
        for <linux-mips@vger.kernel.org>; Mon,  2 Nov 2020 01:01:57 +0100 (CET)
To:     linux-mips@vger.kernel.org
From:   Mauro Condarelli <mc5686@mclink.it>
Subject: Kexec on MIPS32R2?
Message-ID: <21a8d116-ed18-d1f1-9c72-019a619f7ebc@mclink.it>
Date:   Mon, 2 Nov 2020 01:01:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Irideos-Libra-ESVA-Information: Please contact Irideos for more information
X-Irideos-Libra-ESVA-ID: 9C3FA41AF9.A82E2
X-Irideos-Libra-ESVA: No virus found
X-Irideos-Libra-ESVA-From: mc5686@mclink.it
X-Irideos-Libra-ESVA-Watermark: 1604880117.89687@pEhkMU8LNDCNXeY9x+pyWQ
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Can someone confirm (or disconfirm, of course) kexec is supposed to work on MIPS32R2?
My attempts to use it on a MT7628-based board result in a silent hang (watchdog cuts in)
right after:

[  201.309836] kexec_core: Starting new kernel
[  201.318239] Will call new kernel at 004f0000
[  201.322581] Bye ...

Apparently old kernel jumps to `do_kexec()` and just dies; new kernel does not give a peep.
This can be completely my fault, of course, but I would like a confirm this is supposed to work.

Thanks in advance
Mauro Condarelli
