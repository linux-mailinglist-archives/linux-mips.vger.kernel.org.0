Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1241940F9
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2020 15:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbgCZOHT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 26 Mar 2020 10:07:19 -0400
Received: from mx2.suse.de ([195.135.220.15]:34532 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727832AbgCZOHT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 26 Mar 2020 10:07:19 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 03954B147;
        Thu, 26 Mar 2020 14:07:17 +0000 (UTC)
Date:   Thu, 26 Mar 2020 15:07:16 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     jiaxun.yang@flygoat.com, chenhc@lemote.com,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        lixuefeng@loongson.cn, paulburton@kernel.org, ralf@linux-mips.org
Subject: Re: [PATCH v3 1/2] firmware: dmi: Add macro
 SMBIOS_ENTRY_POINT_SCAN_START
Message-ID: <20200326150716.47b4152f@endymion>
In-Reply-To: <8ee01022-d3d1-8145-1a0b-ba77c5bb7101@loongson.cn>
References: <1580875713-18252-1-git-send-email-yangtiezhu@loongson.cn>
        <8ee01022-d3d1-8145-1a0b-ba77c5bb7101@loongson.cn>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Tiezhu,

On Thu, 20 Feb 2020 10:43:56 +0800, Tiezhu Yang wrote:
> Since this patch is independent and it has no any negative influence,
> could you apply it to your DMI tree first?

I've just queued your patch for kernel 5.6. Thanks for your
contribution and sorry for the delay.

-- 
Jean Delvare
SUSE L3 Support
