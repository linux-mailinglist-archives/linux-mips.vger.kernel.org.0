Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A60B56B3B1
	for <lists+linux-mips@lfdr.de>; Fri,  8 Jul 2022 09:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237457AbiGHHkR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Jul 2022 03:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237201AbiGHHkQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Jul 2022 03:40:16 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B2A0286E8
        for <linux-mips@vger.kernel.org>; Fri,  8 Jul 2022 00:40:14 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id l9-20020a056830268900b006054381dd35so15680835otu.4
        for <linux-mips@vger.kernel.org>; Fri, 08 Jul 2022 00:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=X+A+mTpNyJlH0PeJwMb8nriVtueRxw79gp2EJ8QskM4=;
        b=RmMkBjTpsDkFU7OjwOiEp7T02rwwdSewJZlNUpQ9qCu1k3aPj64IlmkhJXgCkE7p/G
         jaEsWnnqkOhWF0PzJnDUC2WK9Z2FCKg9ivDq/shly1TJZFxAzoVTjb/ttZVS4ijlPnzg
         9cEaK9ZL03LP8TVG1Dng6ReS2cmKIJMoJgkyBikt+hG2h3mEX4gktq/5rGEzKxnp/C5r
         3vUiEeQkRAOAvyhAvV6oUc7XJatQbyAFl193QLJpqKuQ424mp9IVCN15p8089h1owDz/
         lTd5xN/Orng53OH1pnbDYrI6r4ZeZYcsjHTBQJiSqY3I/uUn79y6+19eQBGBUW432nB9
         CF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=X+A+mTpNyJlH0PeJwMb8nriVtueRxw79gp2EJ8QskM4=;
        b=J+jsM2/fLm0c0WAbutUuieG9z7hQF2TF1HJ4Y7cBzmZaZPsahZAcPg9SoIiSTCV72K
         reARd2IJW1dBKqlytX3ztvlClmsZZH+QSEzL1G8FPm4sLidDJ0JuelS2StY8VhJ/JfzC
         rSKPYWyuNu+z4Oy7Hj9EdbWrgsYIcITX6x9GHB5gRYT2Iwc1yajf0GpwOW5fdBQsaxpg
         WVQ9xQrmTzoDUzKQKhT1rdK0rbgB6KaSjRGDyNGeY2KDERgu3+1W8GUNBYFP4zuESA73
         dyM0Xhq5MpjcyxORipRMFjD7OL+IopCggHJNzLC8kcNXJROmRvSAcrCUOOUmuw8+qNmv
         khmQ==
X-Gm-Message-State: AJIora+HBBSPq4nsYqPfetblP9NrbENg0Qu03YqjFJjFin7zTqzTqLtJ
        Pnajx3Sh6pv206TJj98F7bPtzsCkN8z/0SsOzp0=
X-Google-Smtp-Source: AGRyM1twPwhBhn3yW6znN0dBpluIhWm2c6Gc7s4XxRi2BY7DMafwBQfZCwuBRKdcbNZfPT686GWGRRX6ou3KRnU0uqk=
X-Received: by 2002:a05:6830:701:b0:616:b7a8:d59b with SMTP id
 y1-20020a056830070100b00616b7a8d59bmr944495ots.362.1657266013900; Fri, 08 Jul
 2022 00:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <9646648c-f1b0-0bd9-91ac-6df589ab66b1@westnet.com.au>
In-Reply-To: <9646648c-f1b0-0bd9-91ac-6df589ab66b1@westnet.com.au>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Fri, 8 Jul 2022 09:40:02 +0200
Message-ID: <CAMhs-H-3uePcq3qxkO=DKiE5uE9kecS8r5tZum-7q4q4WJCqDA@mail.gmail.com>
Subject: Re: rare, inconsistent, unpredictable oops on a Mediatek 7621 platform
To:     Greg Ungerer <gregungerer@westnet.com.au>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        fancer.lancer@gmail.com,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Greg,

On Fri, Jul 8, 2022 at 6:40 AM Greg Ungerer <gregungerer@westnet.com.au> wr=
ote:
>
> Hi All,
>
> I am trying to track down what may be causing a very rare and unpredictab=
le
> kernel oops dump on Mediatek MT7621 SoC based platforms.
>
> I mentioned this initially in this thread,
> https://lore.kernel.org/all/3c4a0ab9-bc54-4584-bb27-d6045096335b@kernel.o=
rg/T/
> but that was more about the memory debug warning than the underlying issu=
e I
> am trying to track down.
>
> Essentially what I am seeing is a variety of unpredictable oops and somet=
imes
> warnings mostly within the memory sub-system. Here is a typical one:
>
> kernel: Unhandled kernel unaligned access[#1]:
> kernel: CPU: 0 PID: 12943 Comm: sh Not tainted 5.15.0 #1
> kernel: $ 0   : 00000000 00000001 00000011 81c10000
> kernel: $ 4   : 80402e80 00000cc0 8117c39c 81c22f48
> kernel: $ 8   : 02e808a6 81b043c8 00000000 81be1000
> kernel: $12   : 81be1000 000083e7 00000000 81be1000
> kernel: $16   : 81b00000 00000000 81b043c8 80402e80
> kernel: $20   : 81c10000 00000001 8117c39c 00000cc0
> kernel: $24   : 00000000 77da5ce8
> kernel: $28   : 835be000 835bfcd0 00000081 8119bcb8
> kernel: Hi    : 0000000f
> kernel: Lo    : 0000003c
> kernel: epc   : 8119bd54 kmem_cache_alloc+0xe4/0x5b8
> kernel: ra    : 8119bcb8 kmem_cache_alloc+0x48/0x5b8
> kernel: Status: 11000403^IKERNEL EXL IE
> kernel: Cause : 40800010 (ExcCode 04)
> kernel: BadVA : 00000011
> kernel: PrId  : 0001992f (MIPS 1004Kc)
> kernel: Modules linked in: xt_statistic xt_realm xt_nat nf_conntrack_netl=
ink arptable_filter arp_tables ip6table_mangle ip6table_raw ip6table_nat ip=
6t_ah ip6table_filter ip6_tables xt_TCPMSS xt_mark iptable_mangle xt_CT ipt=
able_raw xt_connmark iptable_nat xt_set xt_tcpudp xt_conntrack xt_LOG nf_lo=
g_syslog xt_limit xt_addrtype ip_set_hash_netiface ip_set_hash_net ip_set_h=
ash_ip ip_set nfnetlink nf_nat_pptp nf_conntrack_pptp nf_nat_tftp nf_conntr=
ack_tftp nf_nat_ftp nf_conntrack_ftp nf_nat nf_conntrack nf_defrag_ipv6 nf_=
defrag_ipv4 iptable_filter ip_tables x_tables crypto_hw_eip93 ath10k_pci at=
h10k_core ath
> kernel: Process sh (pid: 12943, threadinfo=3D24898ed1, task=3D5506fe17, t=
ls=3D77e28e64)
> kernel: Stack : 00000000 81b043c8 00000001 00000000 81bd38b0 00000000 82b=
e00c0 81b00000
> kernel:         82be00c0 805eb600 81c10000 00000001 82be00c0 8117c39c 000=
00025 00000001
> kernel:         00000081 00000000 81b00000 00000078 00000000 00000081 81b=
00000 82be00c0
> kernel:         81b70000 00000000 00000001 8116f190 82be03c0 5e0db60a 000=
00cc0 00000000
> kernel:         00000000 81b00000 81b00000 556a1074 82be00c0 00000cc0 000=
7ffff 7ffff000
> kernel:         ...
> kernel: Call Trace:
> kernel: [<8119bd54>] kmem_cache_alloc+0xe4/0x5b8
> kernel: [<8117c39c>] __anon_vma_prepare+0x3c/0x1a4
> kernel: [<8116f190>] handle_mm_fault+0x4e8/0xea4
> kernel: [<81167638>] __get_user_pages.part.94+0x154/0x338
> kernel: [<81167e64>] __get_user_pages_remote+0x118/0x3ac
> kernel: [<811ba314>] get_arg_page+0x5c/0x108
> kernel: [<811bacec>] copy_string_kernel+0x104/0x248
> kernel: [<811bbce0>] do_execveat_common+0x148/0x1ec
> kernel: [<811bcc38>] sys_execve+0x34/0x48
> kernel: [<81015570>] syscall_common+0x34/0x58
> kernel:
> kernel: Code: 02c03025  8e62001c  02a21021 <8c460000> 41656000  30a50001 =
 000000c0  8f84000c  00003825
> kernel:
>
> I see a fail like this ending in kmem_cache_alloc() a bit, but not always=
 with
> the same BadVA, or the same call path. Here is another:
>
> kernel: CPU 0 Unable to handle kernel paging request at virtual address c=
200002c, epc =3D=3D 81198c4c, ra =3D=3D 81198b94
> kernel: Oops[#1]:
> kernel: CPU: 0 PID: 18368 Comm: accns_status_mo Not tainted 5.14.0 #1
> kernel: $ 0   : 00000000 00000001 c200002c 00049000
> kernel: $ 4   : 80412200 00000cc0 2f014d31 81c06f98
> kernel: $ 8   : 00100173 81ae83cc 00000000 81bc1000
> kernel: $12   : 81bc1000 00008d34 00000000 81bc1000
> kernel: $16   : 81af0000 00000000 81ae83cc 80412200
> kernel: $20   : 81bf0000 c2000000 8102a1c8 00000cc0
> kernel: $24   : 00000000 8116e93c
> kernel: $28   : 86810000 86811c38 82ff3c8d 81198b94
> kernel: Hi    : 0089543b
> kernel: Lo    : b55e0000
> kernel: epc   : 81198c4c kmem_cache_alloc+0x100/0x5d4
> kernel: ra    : 81198b94 kmem_cache_alloc+0x48/0x5d4
> kernel: Status: 11000403^IKERNEL EXL IE
> kernel: Cause : 40800008 (ExcCode 02)
> kernel: BadVA : c200002c
> kernel: PrId  : 0001992f (MIPS 1004Kc)
> kernel: Modules linked in: xt_statistic xt_realm xt_nat nf_conntrack_netl=
ink arptable_filter arp_tables ip6table_mangle ip6table_raw ip6table_nat ip=
6t_ah ip6table_filter ip6_tables xt_TCPMSS xt_mark iptable_mangle xt_CT ipt=
able_raw xt_connmark iptable_nat xt_set xt_tcpudp xt_conntrack xt_LOG nf_lo=
g_syslog xt_limit xt_addrtype ip_set_hash_netiface ip_set_hash_net ip_set_h=
ash_ip ip_set nfnetlink nf_nat_pptp nf_conntrack_pptp nf_nat_tftp nf_conntr=
ack_tftp nf_nat_ftp nf_conntrack_ftp nf_nat nf_conntrack nf_defrag_ipv6 nf_=
defrag_ipv4 crypto_hw_eip93 iptable_filter ip_tables x_tables ath10k_pci at=
h10k_core ath
> kernel: Process accns_status_mo (pid: 18368, threadinfo=3D2e11cd2a, task=
=3D520aea4f, tls=3D77eb4e64)
> kernel: Stack : 7fb51000 81003af4 00000001 81a39fdc 86810000 82ff3e40 82f=
f3e40 00000000
> kernel:         805e2200 82ff3c8d 81ae0000 805e2240 842da640 8102a1c8 81b=
7b2a0 00000000
> kernel:         00000000 00000000 fffffffc 842da600 fffffffc 81bc1000 81b=
c1000 00008d34
> kernel:         86811ce8 8102a92c 82ff3cd5 8100abbc 86b857f8 842da600 86b=
857f8 842da600
> kernel:         7fb72000 82f26240 8fc40048 c067472c 842da600 82f26240 000=
00021 805e2200
> kernel:         ...
> kernel: Call Trace:
> kernel: [<81198c4c>] kmem_cache_alloc+0x100/0x5d4
> kernel: [<8102a1c8>] vm_area_dup+0x20/0x188
> kernel: [<8102a778>] dup_mm+0x204/0x464
> kernel: [<8102bb8c>] copy_process+0xf44/0x14b4
> kernel: [<8102c2f4>] kernel_clone+0x10c/0x3f4
> kernel: [<8102c7c8>] sys_fork+0x3c/0x60
> kernel: [<81015570>] syscall_common+0x34/0x58
> kernel:
> kernel: Code: 00000000  8e62001c  02a21021 <8c470000> 41656000  30a50001 =
 000000c0  8f84000c  00004025
> kernel:
> kernel: ---[ end trace 166eac26610b0a43 ]---
>
> Here is another that starts with a warning:
>
> kernel: ------------[ cut here ]------------
> kernel: WARNING: CPU: 3 PID: 18640 at mm/rmap.c:243 unlink_anon_vmas+0x24=
c/0x254
> kernel: Modules linked in: xt_statistic xt_realm xt_nat nf_conntrack_netl=
ink arptable_filter arp_tables ip6table_mangle ip6table_raw ip6table_nat ip=
6t_ah ip6table_filter ip6_tables xt_TCPMSS xt_mark iptable_mangle xt_CT ipt=
able_raw xt_connmark iptable_nat xt_set xt_tcpudp xt_conntrack xt_LOG nf_lo=
g_syslog xt_limit xt_addrtype ip_set_hash_netiface ip_set_hash_net ip_set_h=
ash_ip ip_set nfnetlink nf_nat_pptp nf_conntrack_pptp nf_nat_tftp nf_conntr=
ack_tftp nf_nat_ftp nf_conntrack_ftp nf_nat nf_conntrack nf_defrag_ipv6 nf_=
defrag_ipv4 iptable_filter ip_tables x_tables crypto_hw_eip93 ath10k_pci at=
h10k_core ath
> kernel: CPU: 3 PID: 18640 Comm: surelink_test.s Not tainted 5.15.0 #1
> kernel: Stack : 00000000 855944e0 82a0aa80 810823c4 00000000 00000004 000=
00000 17f3f030
> kernel:         8556dcb4 81be3654 81b00000 81b08163 81a4e770 00000001 855=
6dc58 8049bf00
> kernel:         00000000 00000000 81a4e770 8556daf8 fffe67d0 8556db0c 000=
00000 6e696174
> kernel:         20646574 81bec60d 81bec63f 35312e35 81b00000 81a4e770 000=
00009 00000009
> kernel:         00000000 00000100 855621e0 855944e0 00000000 814af81c 000=
af12f 000a906f
> kernel:         ...
> kernel: Call Trace:
> kernel: [<81008ae8>] show_stack+0x38/0x118
> kernel: [<8192c014>] dump_stack_lvl+0x64/0x90
> kernel: [<819258e4>] __warn+0xc0/0xe8
> kernel: [<81925978>] warn_slowpath_fmt+0x6c/0xd0
> kernel: [<8117bfac>] unlink_anon_vmas+0x24c/0x254
> kernel: [<8116a8bc>] free_pgtables+0xa4/0x138
> kernel: [<81174c5c>] exit_mmap+0x9c/0x1f0
> kernel: [<8102a59c>] mmput+0x50/0xe8
> kernel: [<81031624>] do_exit+0x3b0/0xa74
> kernel: [<81031d6c>] do_group_exit+0x4c/0xb8
> kernel: [<81031dec>] __wake_up_parent+0x0/0x14
> kernel:
> kernel: ---[ end trace 60b85e4a50ed0816 ]---
>
> Here's another slightly different again:
>
> kernel: BUG: Bad page map in process led  pte:00303a85 pmd:85b6f000
> kernel: page:79d2e80b refcount:1 mapcount:-1 mapping:687c3a7b index:0x28 =
pfn:0x303
> kernel: memcg:80450800
> kernel: aops:0x81952030 ino:16f dentry name:"httpd"
> kernel: flags: 0x36(referenced|uptodate|lru|active|zone=3D0)
> kernel: raw: 00000036 80014f4c 80014f94 8083ec78 00000028 00000000 ffffff=
fe 00000001
> kernel: raw: 80450800
> kernel: page dumped because: bad pte
> kernel: addr:555a8000 vm_flags:00000075 anon_vma:00000000 mapping:8083ec7=
8 index:28
> kernel: file:sh fault:filemap_fault mmap:generic_file_readonly_mmap readp=
age:squashfs_readpage
> kernel: CPU: 2 PID: 3166 Comm: led Not tainted 5.15.0 #1
> kernel: Stack : 00000000 80014f6c 81b03ee0 810823c4 00000000 00000004 000=
00000 1a6638d0
> kernel:         859e1c44 81be3654 81b00000 81b08163 81a4e770 00000001 859=
e1be8 80499c00
> kernel:         00000000 00000000 81a4e770 859e1a88 00133bc0 859e1a9c 000=
00000 63612d30
> kernel:         6d6f4320 81bf3d8c 81bf3db2 6c203a6d 81b00000 81a4e770 000=
00000 8083ec78
> kernel:         81b00000 555a8000 85ad0554 80014f6c 00000000 814af81c 000=
00008 81be0008
> kernel:         ...
> kernel: Call Trace:
> kernel: [<81008ae8>] show_stack+0x38/0x118
> kernel: [<8192c014>] dump_stack_lvl+0x64/0x90
> kernel: [<81169774>] print_bad_pte+0x190/0x200
> kernel: [<8116c1e0>] unmap_page_range+0x6fc/0x8b4
> kernel: [<8116c72c>] unmap_vmas+0x6c/0x98
> kernel: [<81174c48>] exit_mmap+0x88/0x1f0
> kernel: [<8102a59c>] mmput+0x50/0xe8
> kernel: [<81031624>] do_exit+0x3b0/0xa74
> kernel: [<81031d6c>] do_group_exit+0x4c/0xb8
> kernel: [<81031dec>] __wake_up_parent+0x0/0x14
>
>
> Code paths into VMA routines are by far the most common. All the above du=
mps
> go through there.
>
> The difficulty for me debugging here is that this is very rare. I have no=
 way
> at this point to reliably reproduce the behavior. Maybe once a month it h=
appens.
> Oh and this is not just a single device, the behavior has been observed o=
n a
> number of individual devices, not consistently just one device.
>
> The dumps I listed above are on a MediaTek MT7621 (MIPS32r2) based platfo=
rm.
> The platform is used as a router type device, so lots of network activity=
, from
> wired ethernet and USB based cell modems. Though I never see any crashes/=
oops
> on driver or hardware code paths.
>
> I have seen this across a variety of kernel versions. Certainly from abou=
t
> 5.14 onwards.
>
> I tried enabling quite a few of the kernel's memory debug options, but no=
thing
> trips for me running those. Unfortunately running with those options enab=
led
> eventually leads to the OOM killer kicking in after a couple of hours.
>
> Not sure how to figure out what is leading to these?

This is definitely not happening to me in my Mt7621 related boards. I
have two boards:
- GNUBee PC-1
- HiLink HLK-7621A evaluation board

I am currently using kernel 5.15 from [1] with this configuration for
GnuBee [2] and openWrt master branch [3] with kernel 5.15 and openWrt
patches [4] for the HiLink board.

Let me know if you want me to check something on my side.

>
> Regards
> Greg

Best regards,
    Sergio Paracuellos

[1]:  https://github.com/neilbrown/linux/tree/gnubee/v5.15
[2]: https://github.com/neilbrown/gnubee-tools/blob/master/kern_config/gbpc=
1u-5.15
[3]: https://github.com/openwrt/openwrt
[4]: https://github.com/openwrt/openwrt/tree/master/target/linux/ramips/pat=
ches-5.15

>
