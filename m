Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 083AB16610C
	for <lists+linux-mips@lfdr.de>; Thu, 20 Feb 2020 16:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728295AbgBTPfM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Feb 2020 10:35:12 -0500
Received: from forward501p.mail.yandex.net ([77.88.28.111]:59269 "EHLO
        forward501p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728276AbgBTPfM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 20 Feb 2020 10:35:12 -0500
X-Greylist: delayed 382 seconds by postgrey-1.27 at vger.kernel.org; Thu, 20 Feb 2020 10:35:10 EST
Received: from mxback8o.mail.yandex.net (mxback8o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::22])
        by forward501p.mail.yandex.net (Yandex) with ESMTP id 046E43500294;
        Thu, 20 Feb 2020 18:28:47 +0300 (MSK)
Received: from localhost (localhost [::1])
        by mxback8o.mail.yandex.net (mxback/Yandex) with ESMTP id GVR8Slzjn4-SiLuPZj7;
        Thu, 20 Feb 2020 18:28:46 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=golovin.in; s=mail; t=1582212526;
        bh=k/p2VUDosGYu66ErCK1cPAKJ+mVO7o9ELRCaJtjIexc=;
        h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
        b=2+ttcKBpiXC21CcREE3+BPQNUeZ51CmWkc+4uVPoc+qHwQv5WcAmaqKS/CZ4kczw/
         Dnvak8IPS7uQb+4wI8627YdrHeRu+RoGmZ7sQOoYTiZjJluI+iA8RfFbHQVhuvhXbH
         JVb0lWtfbJ9M4F0gUDQ1VHQVSgailQdS5RoQXSDc=
Authentication-Results: mxback8o.mail.yandex.net; dkim=pass header.i=@golovin.in
Received: by sas8-7ec005b03c91.qloud-c.yandex.net with HTTP;
        Thu, 20 Feb 2020 18:28:44 +0300
From:   Dmitry Golovin <dima@golovin.in>
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        "f4bug@amsat.org" <f4bug@amsat.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "clang-built-linux@googlegroups.com" 
        <clang-built-linux@googlegroups.com>,
        "paulburton@kernel.org" <paulburton@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
In-Reply-To: <CAKwvOdkaLRE0Ek3PnmqE2P3Urn4+pwfAp-qQdsLurwERcqNXfQ@mail.gmail.com>
References: <20200211212455.3307-1-mark.tomlinson@alliedtelesis.co.nz>
         <CAAdtpL5Tf-8O=xMKO33DWDs=2_Hsdk=FQSNO5Gsrx=9hWvENdg@mail.gmail.com>
         <8e852d84c8b0c6b35faa3b3f2a1034d93a6e8967.camel@alliedtelesis.co.nz> <8cb14684e2f774d9573c062f2d82ad5348c5fee7.camel@alliedtelesis.co.nz> <CAKwvOdkaLRE0Ek3PnmqE2P3Urn4+pwfAp-qQdsLurwERcqNXfQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: cavium_octeon: Fix syncw generation.
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Thu, 20 Feb 2020 17:28:44 +0200
Message-Id: <37043091582212524@sas8-7ec005b03c91.qloud-c.yandex.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

18.02.2020, 20:37, "'Nick Desaulniers' via Clang Built Linux" <clang-built-linux@googlegroups.com>:
>>  There is an effort underway to build the kernel with clang[1]. I'm not
>>  sure what that ends up using for an assembler or if it'll even be able
>>  to target mips64 anytime soon.

I have a working build for MIPS64 (only mips64r6 at the moment), the
config is based on malta_defconfig and it boots in qemu. I still don't
have a matching buildroot image, but it shouldn't be a problem.

Regards,
Dima
