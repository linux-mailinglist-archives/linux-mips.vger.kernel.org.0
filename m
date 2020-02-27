Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB40172382
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2020 17:36:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730287AbgB0QfV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Feb 2020 11:35:21 -0500
Received: from relaygw4-1.mclink.it ([213.21.178.144]:50619 "EHLO
        relaygw4-1.mclink.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730246AbgB0QfV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 Feb 2020 11:35:21 -0500
Received: from [172.24.30.42] (HELO smtpoutgw2.mclink.it)
  by relaygw4-1.mclink.it (CommuniGate Pro SMTP 6.0.6)
  with ESMTP id 168942418 for linux-mips@vger.kernel.org; Thu, 27 Feb 2020 17:35:19 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2BYAACC7lde/4bkE1cNWRwBAQEBAQcBA?=
 =?us-ascii?q?REBBAQBAYFqBAEBCwGIWZEPg26GA4E+kA4JAQEBAQEBAQEBNwQBAYQ2CgKCLDc?=
 =?us-ascii?q?GDgIQAQEGAQEBAQEFBIwUAQEBAyNmCw4KAgImAgJXBgEMCAEBgyKCV68/dYEyh?=
 =?us-ascii?q?UqDN4E+gQ4qAYx9gUGBESeCbD6HXIJeBIE/AQEBlheJAI88AQYCgWJcll8GHIJ?=
 =?us-ascii?q?JiBuQSo5wmF+EeIF7gl6BT08lnGaQJgEB?=
Received: from host134-228-dynamic.19-87-r.retail.telecomitalia.it (HELO [192.168.7.101]) ([87.19.228.134])
  by smtpoutgw2.mclink.it with ESMTP; 27 Feb 2020 17:35:18 +0100
Subject: Re: MIPS Hardware support
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
References: <20200227144910.GA25011@alpha.franken.de>
From:   Mauro Condarelli <mc5686@mclink.it>
Message-ID: <2be5f250-36fa-9aad-0e72-820c7849fe34@mclink.it>
Date:   Thu, 27 Feb 2020 17:34:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200227144910.GA25011@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi All.

On 2/27/20 3:49 PM, Thomas Bogendoerfer wrote:
> Hi,
>
> we have 47 MIPS system types and I'd like to get an overview how alive
> they really are. I've already grouped the 47 systems a little bit by
> hardware I already own and regulary test kernels. Could you please
> give me some feedback about the "unclassified" systems ? What systems
> are supported by qemu (real test not just repeating qemu docs) ?
> Thank you for your help.
>
> Thomas.
>
FYI: I am successfully running 5.5 kernel on VoCore2 board (MT7628).
I had to somewhat cripple clock management to have fully working
MMC (too ashamed by that crappy code to even try to send
upstream), but it is otherwise fully working.

Mauro

