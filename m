Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC3231003A8
	for <lists+linux-mips@lfdr.de>; Mon, 18 Nov 2019 12:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbfKRLSt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 Nov 2019 06:18:49 -0500
Received: from forward500p.mail.yandex.net ([77.88.28.110]:52954 "EHLO
        forward500p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726460AbfKRLSt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 18 Nov 2019 06:18:49 -0500
Received: from mxback1q.mail.yandex.net (mxback1q.mail.yandex.net [IPv6:2a02:6b8:c0e:39:0:640:25b3:aea5])
        by forward500p.mail.yandex.net (Yandex) with ESMTP id 255F594088C;
        Mon, 18 Nov 2019 14:18:46 +0300 (MSK)
Received: from localhost (localhost [::1])
        by mxback1q.mail.yandex.net (mxback/Yandex) with ESMTP id cUfR7ugG27-IiB0SAiK;
        Mon, 18 Nov 2019 14:18:44 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1574075924;
        bh=CvsGLJ9lGUisxTAaa4tQwD8QioWNvSLyZz4c/+wP8A0=;
        h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
        b=sS1WeYSguIkXgltogEr0miIhnsWxb/ufJBk96t+zUexWKgOVvLBKml3twgdfukLog
         YCevvyxIwe2kMkR7E5/t9Y1Kdhsvquf/+2PRW86zqMQjsS6AgLqI6eEFBY9U5uwYLv
         vAeQ6NqweAC7O+OKvyTOQod301g/Mw+l2nXIB1jM=
Authentication-Results: mxback1q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla3-a60e960147e7.qloud-c.yandex.net with HTTP;
        Mon, 18 Nov 2019 14:18:44 +0300
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Envelope-From: yjx@flygoat.com
To:     Jean Delvare <jdelvare@suse.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Yinglu Yang <yangyinglu@loongson.cn>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
In-Reply-To: <123521801574075616@iva1-ef4837f8671e.qloud-c.yandex.net>
References: <1573478985-3535-1-git-send-email-yangtiezhu@loongson.cn> <123521801574075616@iva1-ef4837f8671e.qloud-c.yandex.net>
Subject: Re: [PATCH v2] MIPS: Scan the DMI system information
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Mon, 18 Nov 2019 19:18:44 +0800
Message-Id: <52253341574075924@vla3-a60e960147e7.qloud-c.yandex.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



18.11.2019, 19:13, "Jiaxun Yang" <jiaxun.yang@flygoat.com>:
> 11.11.2019, 21:30, "Tiezhu Yang" <yangtiezhu@loongson.cn>:
>>  Enable DMI scanning on the MIPS architecture, this setups DMI identifiers
>>  (dmi_system_id) for printing it out on task dumps and prepares DIMM entry
>>  information (dmi_memdev_info) from the SMBIOS table. With this patch, the
>>  driver can easily match various of mainboards.
>>
>>  In the SMBIOS reference specification, the table anchor string "_SM_" is
>>  present in the address range 0xF0000 to 0xFFFFF on a 16-byte boundary,
>>  but there exists a special case for Loongson platform, when call function
>>  dmi_early_remap, it should specify the start address to 0xFFFE000 due to
>>  it is reserved for SMBIOS and can be normally access in the BIOS.
>>
>>  This patch works fine on the Loongson 3A3000 platform which belongs to
>>  MIPS architecture and has no influence on the other architectures such
>>  as x86 and ARM.
>>
>>  Co-developed-by: Yinglu Yang <yangyinglu@loongson.cn>
>>  Signed-off-by: Yinglu Yang <yangyinglu@loongson.cn>
>>  [jiaxun.yang@flygoat.com: Refine definitions and Kconfig]
>>  Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>  Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>>  ---
>
> Hi Jane,

Sorry Jean, apologize for my typo.

>
> Is it fine for you?
> If so please give a Ack.
>
> Thanks.
> --
> Jiaxun Yang
