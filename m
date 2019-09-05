Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7A29A9C05
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 09:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731596AbfIEHi5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Sep 2019 03:38:57 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25441 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729809AbfIEHi5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Sep 2019 03:38:57 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1567669108; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=JD0RJDc1y1nbgEDoFeWUP1aa+1E2q9cUCgmHftygJWttkWU0ij0FSN0agcqXn8mGLRaSZzmN57MaN6cehFmvpEG1fwFbMz20hfcBzT+WlS4UP4KGPqqw5fK1Qq8lqKc9tMDUxG6YiZFCjKCZP03oolXP6ohtRKJSZzI5sSEoE2Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1567669108; h=Cc:Date:From:Message-ID:Subject:To:ARC-Authentication-Results; 
        bh=YMRu90FAXl9d4UtZOuk31CTU2wRDKadQhbA6lJKKfN0=; 
        b=Gg/Y8QVU8tw+PUl15qldJfTEYw5r0HK0HGAQn4NaBBAJvfX60bRAaUp3TJ0tT61RVS766n1N6TLjLE0AHt4jUXTsjlVnldN5L7jCEm6Qk6OydmPTjxZ08TV5TlsslA7+c+URm8kfeqnlyMM6kKZNsor2jh3f4CvE2Oi4GwLLALk=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id; 
  b=K2Kxbxy7Q9eU1GWFRAstrHfd4MkTobYbU5Ye0GoeNjVPgKxfMp0akXKHawnHEHiIaVahiFqR8zXU
    xQNHR/DkSxHFQ/KMsQQSewxGWAidp4A+08ut7tYMtfwro9lmjBJi  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1567669108;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id; l=298;
        bh=YMRu90FAXl9d4UtZOuk31CTU2wRDKadQhbA6lJKKfN0=;
        b=c6TILrT4jx+L+K9sBldgDVbZLSg+wVByx/GjF2G8ruBjIAGxzVZc7xp32p4KB7jm
        YJlleqgemKPDLGGYB7qGfm2hmBGs6G9ax6fjJo1PxiPWibI7VYDK+9kMmsvyAI5Mnhi
        4ZYn7904ROGq0oyza/XTbsCQ0Ob/nMpbnRwOzEn8=
Received: from zhouyanjie-virtual-machine.localdomain (125.71.5.36 [125.71.5.36]) by mx.zohomail.com
        with SMTPS id 1567669107399529.6408512576533; Thu, 5 Sep 2019 00:38:27 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, ulf.hansson@linaro.org,
        paul.burton@mips.com, linus.walleij@linaro.org,
        paul@crapouillou.net, malat@debian.org, yuehaibing@huawei.com,
        ezequiel@collabora.com, robh+dt@kernel.org, mark.rutland@arm.com,
        syq@debian.org, jiaxun.yang@flygoat.com
Subject: MMC: Ingenic: Add support for 8bit mode and LPM and JZ4760 Soc
Date:   Thu,  5 Sep 2019 15:38:05 +0800
Message-Id: <1567669089-88693-1-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.adjust the macro definition name to match the corresponding
  register name in the datasheet.
2.add support for 8bit mode, now supports 1bit/4bit/8bit modes.
3.add support for probing mmc driver on the JZ4760 Soc from Ingenic.
4.add support for Low Power Mode of Ingenic's MMC/SD Controller.


