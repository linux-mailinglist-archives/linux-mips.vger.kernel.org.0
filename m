Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06259107FD1
	for <lists+linux-mips@lfdr.de>; Sat, 23 Nov 2019 19:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbfKWSPA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 Nov 2019 13:15:00 -0500
Received: from sender4-pp-o97.zoho.com ([136.143.188.97]:25725 "EHLO
        sender4-pp-o97.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbfKWSPA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 23 Nov 2019 13:15:00 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574532890; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=FJJjui7nV/ZNN1Rx8QvVjgMhJk4ZoeEJov7UXfqcdi0QrfZ4cYxG5o+ljylp3sxZ3JpryTVplgX/s5fRhs5KlYtm0hwfooh/1dYqHp9UPut2c0TEeR/1b7DRBWt6kKp5Wn+HGAMiv98ouRJTaLQu5i7EJdS3WyXudu+XxYQqRCk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574532890; h=Cc:Date:From:Message-ID:Subject:To; 
        bh=H94x1tfJHQJNFBM0ErsvL0Uudwa/ZEgpUH9VtK3qs9s=; 
        b=DgsarA3B5bEEcVfEOcoZgbk5WUbmVNE31CCOAgw0B0ZTAPEoV+aki/YkMqsoiFnmxQguNXdJG8amai8mt8SH++YzkOEe2NsRiukwmkrlMGDi2ml+mO+zTm/xGLr/hAUBbuRtKl2h0ftFCpqOJXKn/Kbenmn/BvkpP86pOtxUwDY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id; 
  b=m3TfuYGY062VoEhYG7TyUWNj6+/aobs7c2tUYh2qAuwLC866iT3BQN3+Fo5ovyaVYojvu/4bb85p
    EFxyZu65T67KSnSz4dbb3a7enM8zPG+0HJ5W4NtzJws92p2K47iS  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574532890;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=H94x1tfJHQJNFBM0ErsvL0Uudwa/ZEgpUH9VtK3qs9s=;
        b=osuOmhvSAwafp/ZI9m0Y4Iwmkp665XB7x85IQgLbYuSpoUPUeZyn2WIuzJqNmC8f
        N6bOsEfv6tbgtehR+IFOZ3QXgE7YD6YbkRdOQ0ZYW/IQnH1HpQFJJrz/qrB6d6OwfM3
        TwuHbLoUAYgh3QZ8T3yoZjn9A+WfWwqH5SWlOsnQ=
Received: from localhost.localdomain (171.221.112.247 [171.221.112.247]) by mx.zohomail.com
        with SMTPS id 1574532888652420.3861808291093; Sat, 23 Nov 2019 10:14:48 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, mark.rutland@arm.com,
        linus.walleij@linaro.org, paul@crapouillou.net
Subject: Fix bugs in X1000/X1500 and add X1830 pinctrl driver v4.
Date:   Mon, 18 Nov 2019 02:14:05 +0800
Message-Id: <1574014449-112057-1-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v3->v4:
1.Use local variables to streamline code.
2.Prevents processors older than X1830 from being
  configured in HiZ mode.


